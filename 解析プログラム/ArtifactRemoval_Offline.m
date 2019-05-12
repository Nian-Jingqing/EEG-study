clear all
close all

for j=2:5
dir = ('G:\脳波データ(済生会)\2018年11月'); %フォルダ識別
data_mat = ['tobe',num2str(j)];
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
tempECG = whos('*mffECG');
eval(['dataECG = ',tempECG(1).name,';']);

Fs          = 1000;
fs          = 200;
TR_num      = 200;
TR_sample   = 3000;

trial_num   = 20;
t_blank1    = 6;
t_rest      = 9;
t_ref       = 9;
t_ready     = 0;
t_task      = 9;
t_blank2    = 0;

roi         = 36;
trial_count = 1;

T               = zeros(2,6);
T(1,:)          = [t_blank1, t_rest, t_ref, t_ready, t_task, t_blank2];
T(2,:)          = [T(1,1), T(1,1)+T(1,2)-T(1,3), T(1,1)+T(1,2), T(1,1)+T(1,2)+T(1,4), ...
    T(1,1)+T(1,2)+T(1,4)+T(1,5), T(1,1)+T(1,2)+T(1,4)+T(1,5)+T(1,6)];
clear t_blank1 t_rest t_ref t_ready t_task t_blank2;

n           = 3;
Band        = [3,95];
notch       = 50;

[BandB,BandA]   = butter(n,Band/(fs/2),'bandpass');
[NotchB,NotchA] = butter(n,[notch-1,notch+1]/(fs/2),'stop');


calc_sample = 0.1 * Fs;

AASnum      = 4;   % number of average artifact subtraction
AASsize     = Fs;
AASinterval = 0.1 * Fs;

OBSnum      = 30;
BCGsize     = 0.8 * Fs;
pcnum       = 4;
ECGsign = 1;

n           = 3;
Band        = [3,95];
notch       = 50;
recordingtag = 3;

freq_fb     = 8:12;  % Hz
freq_fb     = freq_fb+1;
fb_min      = -100;  % percent ERS
ch          = [33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122];
ch_num      = 129;
h               = hanning(fs);
H               = repmat(h,[1,ch_num]);
GRAtemp = zeros(AASsize,ch_num+1);
Power    = zeros(T(2,6)*Fs/calc_sample,trial_num);
TF       = zeros(notch+1,T(2,6)*Fs/calc_sample,trial_num);
TP       = zeros(notch+1,ch_num,T(2,6)*Fs/calc_sample,trial_num);
pos3 = [1090 50 800 900];

calc_count=11;

% data=detrend(data);
data(130,:)=dataECG;
data=data(:,cell2mat(evt_255_DINs(4,strmatch('DIN1',evt_255_DINs(1,:)))):end)';
% data=data(:,17000:end)';
datasize=size(data,1);

%%%% Buffer

Buffer     = zeros(fs,ch_num);

buffersize = OBSnum * Fs;

Buffer0  = zeros(Fs,ch_num+2);
Buffer01 = zeros(Fs,ch_num+1);

Buffer1 = zeros(2*Fs,ch_num+2);
Buffer11 = zeros(AASsize+AASinterval*AASnum,ch_num+1);
Buffer12 = zeros(AASsize,ch_num+1);

Buffer2 = zeros(OBSnum*Fs,ch_num+1);
Buffer22 = zeros(OBSnum*fs,ch_num);

BufferRem1 = zeros(Fs*2,ch_num+1);

BufferRem2 = zeros(OBSnum*Fs,ch_num+1);

BufferRem3 = zeros(OBSnum*Fs,ch_num);

BufferG1   = zeros(AASsize+AASinterval*AASnum,ch_num+1);
BufferG2   = zeros(AASsize,ch_num+1);
GRAone        = ones(AASsize,1);
ARwave = zeros(round(datasize/(Fs/fs)),ch_num);
Mov = zeros(10,1);

while calc_count*calc_sample<=datasize
    if trial_count <= trial_num
        if recordingtag == 3
            Buffer_offline=double(data(1:calc_count*calc_sample,:));
        elseif recordingtag == 4
            Buffer_offline=double(data(calc_count*calc_sample+1:calc_count*calc_sample+AASsize+AASinterval*AASnum,:));
        end
        if  calc_count * calc_sample >= AASsize + AASinterval * AASnum
            recordingtag = 4;
        end
        
        GRAtemp = zeros(AASsize,ch_num+1);
        
        if recordingtag >= 3
            if recordingtag == 3
                for i=1:(calc_count*calc_sample-AASsize)/AASinterval
                    GRAtemp = GRAtemp + Buffer_offline(AASinterval*(i-1)+1:AASinterval*(i-1)+AASsize,:);
                end
                GRAtemp = GRAtemp / (calc_count*calc_sample-AASsize) * AASinterval;
                
            elseif recordingtag == 4
                for i=1:AASnum
                    GRAtemp = GRAtemp + Buffer_offline(AASinterval*(i-1)+1:AASinterval*(i-1)+AASsize,:);
                end
                GRAtemp = GRAtemp / AASnum;
            end
            
            for i=1:ch_num+1
                [~,~,Buffer12(:,i)] = regress(Buffer_offline(end-AASsize+1:end,i),[GRAone,GRAtemp(:,i)]);
            end
            Buffer2(1:end-calc_sample,:)     = Buffer2(1+calc_sample:end,:);
            Buffer2(end-calc_sample+1:end,:) = Buffer12(end-calc_sample+1:end,:);
        end
        
        %%% subtract BCG artifact
        
        Buffer21 = -Buffer2(1:Fs/fs:end,:);
        
        Buffer22(1:end-calc_sample/Fs*fs,:)     = Buffer22(1+calc_sample/Fs*fs:end,:);
        Buffer22(end-calc_sample/Fs*fs+1:end,:) = Buffer21(end-calc_sample/Fs*fs+1:end,1:ch_num);
        
        
        Buffer21(:,end) = ECGsign*filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,Buffer21(:,end)));
        
        if exist('Lrt','var') ~= 1 &&  calc_count * calc_sample > AASsize + AASinterval * AASnum
            [pks,QRS] = findpeaks(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end),...
                'minpeakdistance',min(0.4*fs,(calc_count*calc_sample-AASsize)/Fs*fs-2),'minpeakheight',600);
            if max(pks)>3e3
                QRS(pks>3e3)=[];
                pks(pks>3e3)=[];
            end
            if size(QRS,1) >= 2
                Lrt = round((QRS(end)-QRS(1))/(size(QRS,1)-1)/2)*2;
            end
        end
        
        if exist('Lrt','var')
            [~,QRS] = findpeaks(Buffer21(end-(0.21*fs+Lrt/2)-calc_sample/Fs*fs:end-(0.21*fs+Lrt/2)+1,end),...
                'minpeakdistance',min(0.4*fs,calc_sample/Fs*fs),'minpeakheight',mean(pks)*0.6);
            
            if isempty(QRS) ~= 1
                if calc_count * calc_sample >= AASsize + OBSnum*Fs
                    [pks,QRS] = findpeaks(Buffer21(1:end,end),...
                        'minpeakdistance',0.4*fs,'minpeakheight',mean(pks)*0.6);
                else
                    [pks,QRS] = findpeaks(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end),...
                        'minpeakdistance',min(0.4*fs,(calc_count*calc_sample-AASsize)/Fs*fs-2),'minpeakheight',mean(pks)*0.6);
                end
                if max(pks)>3e3
                    QRS(pks>3e3)=[];
                    pks(pks>3e3)=[];
                end
                
                while isempty(QRS) ~= 1 && QRS(1)+0.21*fs-Lrt/2 < 0
                    QRS(1) = [];
                end
            end
            
            if isempty(QRS) ~= 1
                if calc_count * calc_sample < AASsize + OBSnum*Fs
                    QRS = QRS + buffersize/Fs*fs - (calc_count*calc_sample-AASsize)/Fs*fs;
                end
                
                while isempty(QRS) ~= 1 && QRS(end)+0.21*fs+Lrt/2 > buffersize/Fs*fs
                    QRS(end) = [];
                end
            end
            
            if isempty(QRS) ~= 1
                if size(QRS,1) > 1
                    OBS = zeros(Lrt,size(QRS,1),ch_num);
                    for i=1:size(QRS,1)
                        OBS(:,i,:) = Buffer21(QRS(i)+0.21*fs-Lrt/2+1:QRS(i)+0.21*fs+Lrt/2,1:ch_num);
                    end
                    
                    for i=1:ch_num
                        [obsc,obss,~,~,~,obsm] = pca(OBS(:,:,i));
                        obs = obss(:,1:min(size(QRS,1)-1,pcnum))*obsc(:,1:min(size(QRS,1)-1,pcnum))'+repmat(obsm,[Lrt,1]);
                        Buffer22(QRS(end)+0.21*fs-Lrt/2+1:QRS(end)+0.21*fs+Lrt/2,i) = ...
                            Buffer21(QRS(end)+0.21*fs-Lrt/2+1:QRS(end)+0.21*fs+Lrt/2,i) - obs(:,end);
                    end
                    
                    Lrt = round((QRS(end)-QRS(1))/(size(QRS,1)-1)/2)*2;
                end
            end
            
        end
        
        
        
        Buffer = Buffer22(end-2*fs+1:end-fs,:);
        
        %
        %     count_sample = count_sample - calc_sample;
        calc_count   = calc_count + 1;
        time_count   = mod(calc_count*calc_sample,T(2,6)*Fs)/Fs;
        
        Buffer = filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,Buffer));
        
        Signal00 = Buffer-repmat(mean(Buffer(:,ch),2),1,ch_num); %CAR
        ARwave(1+fs*(calc_count-1):fs*calc_count,:) = Signal00;
        Signal_allch = Signal00.* H;
        Signal_allch = fft(Signal_allch);
        Signal_allch = abs(Signal_allch) .^ 2;
        
        Signal0 = Buffer(:,roi) - mean(Buffer(:,ch),2); %CAR
%         ARwave(1+fs*(calc_count-1):fs*calc_count) = Signal0;
        Signal  = Signal0 .* h;
        Signal  = fft(Signal);
        Signal  = abs(Signal) .^ 2;
        
        Power(time_count*10+1,trial_count) = mean(Signal(freq_fb));
        TP(:,:,time_count*10+1,trial_count) = Signal_allch(1:notch+1,:);
        TF(:,time_count*10+1,trial_count)  = Signal(1:notch+1);
        
        if trial_count >= 1
            if time_count == T(2,1)-1
                %% Rest moji
            end
            
            if time_count == T(2,1)
                %% Rest din
            end
            
            if time_count > T(2,2) && time_count <= T(2,4)
                %% Reference
                Ref0(:,round((time_count-T(2,2))*10)) = Signal;
            end
            
            if time_count == T(2,3)
                
            end
            
            if time_count >= T(2,4) && time_count < T(2,5)
                %% Task
                if time_count == T(2,4)
                    Ref     = mean(Ref0,2);
                    %                     Mean051 = mean(Ref(freq_fb));
                    %                     set(plot051,'ydata',[Mean051 Mean051]);
                    %                     set(disp05,'ylim',[0 max(1,Mean051*2)]);
                    %                     set(str1,'string','Task','color','r');
                    %                     drawnow;
                end
                
                ERD          = (Signal - Ref) ./ Ref * 100;
                Mov(1:end-1) = Mov(2:end);
                Mov(end)     = mean(ERD(freq_fb));
                value        = max(min(-fb_min,mean(Mov)),-100);
                
                %                 if     type_fb == 1
                %                     if value >= 0
                %                         set(img1,'CData',imghand{1});
                %                     else
                %                         imgnum = min(ceil(-value/4)+1,21);
                %                         %         imgnum = ceil(-value/5)+1;
                %                         set(img1,'CData',imghand{imgnum});
                %                     end
                %
                %                 elseif type_fb == 2
                %                     set(plot0,'ydata',-value,'xdata',3);
                %                 end
                %                 drawnow;
                
            end
            
            if time_count == T(2,5)
                
            end
        end
        
        if time_count == 0
            trial_count = trial_count + 1;
            Ref0        = Ref0 * 0;
            Mov         = Mov  * 0;
        end
    else
        break;
    end
end

TFcut  = TF(:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
ref = repmat(mean(TFcut(:,1:T(1,3)*Fs/calc_sample,:),2),[1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
ER  = (TFcut - ref)./ref * 100;
if trial_count>=3
    figure(j); clf(gcf); set(gcf,'position',pos3);
    for i=2:trial_count-1
        subplot(8,6,i-1);
        imagesc(0:18,0:50,mean(ER(:,:,i),3));
        set(gca,'ydir','normal','clim',[-100 100],'fontsize',10); colormap('jet');
    end
    subplot(8,6,25:48);
    imagesc(0:18,0:50,mean(ER(:,:,2:trial_count-1),3));
    set(gca,'ydir','normal','clim',[-100 100],'fontsize',20); colormap('jet'); r = colorbar;
    r.Label.String = 'ERP (%)';
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    drawnow;
end

run('ChannnelLocation.m');
TPcut  = TP(:,:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
ref2 = repmat(mean(TPcut(:,:,1:T(1,3)*Fs/calc_sample,:),3),[1,1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
ER2 = (TPcut - ref2)./ref2 * 100;   %[f ch window trial]
ERP_alltrial = mean(ER2,4);     %[f ch window]
ERP_alltrial = permute(ERP_alltrial,[1 3 2]);   %[f window ch]
temp = ERP_alltrial(:,T(1,2)*Fs/calc_sample+1:end,:);        % range幅のERPを抜き出す　[f window ch]
ERP_mean = squeeze(mean(temp,2));     % trial、時間方向の平均を計算する [f ch]
temp_alpha = ERP_mean(9:13,:);   % FOI(α)
% temp_lowbeta = ERP_mean(15:22,:); %FOI(lowβ)
% temp_highbeta = ERP_mean(23:31,:); %FOI(highβ)
ERP_alpha = mean(temp_alpha,1)';
% ERP_lowbeta = mean(temp_lowbeta,1)';
% ERP_highbeta = mean(temp_highbeta,1)';
% ERP_foi = ERP_foi.';

figure(j+10); clf(gcf); set(gcf,'position',[50,300,600,400]);
% subplot(1,3,1);
topography(ERP_alpha,loc,3);
c=jet;
c=flipud(c);
colormap(c);
c=colorbar;
c.Label.String='ERD/ERS(%)';
caxis([-100 100]);
set(gca,'FontSize',14,'FontName','Helvetica')

% subplot(1,3,2);
% topography(ERP_lowbeta,loc,3);
% c=jet;
% c=flipud(c);
% colormap(c);
% c=colorbar;
% c.Label.String='ERD/ERS(%)';
% caxis([-100 100]);
% set(gca,'FontSize',14,'FontName','Helvetica')
% 
% subplot(1,3,3);
% topography(ERP_highbeta,loc,3);
% c=jet;
% c=flipud(c);
% colormap(c);
% c=colorbar;
% c.Label.String='ERD/ERS(%)';
% caxis([-100 100]);
% set(gca,'FontSize',14,'FontName','Helvetica')

save(data_mat,'Power','TF','TP','ARwave');
clear -regexp ^tobe
end
