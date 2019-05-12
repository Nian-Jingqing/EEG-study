%
% Gra 0.1sec-interval*4 1sec-aas and BCG OBS
%
%

% load('E:\files_2017\experimental_data\netstation\mat\1222yamamoto\yamamoto17122201.mat', 'yamamoto17122201mff', 'yamamoto17122201mffECG', 'evt_MR_Pu');
% load('E:\files_2017\experimental_data\netstation\mat\1110kobayashi\kobayashi04_20171110.mat', 'kobayashi04_20171110mff', 'kobayashi04_20171110mffECG', 'evt_MR_Pu')
% load('E:\experimental_data\netstation\mat\0219morishita\morishita05_during.mat', 'morishita05_duringmff', 'morishita05_duringmffECG', 'evt_MR_Pu')
% ECGsimulate = who('*mff');
% ECGsimulate = ECGsimulate{1};
% EEGsimulate = eval(['transpose(',ECGsimulate,'(:,evt_MR_Pu{4,1}:end));']);
% ECGsimulate = eval(['transpose(',ECGsimulate,'ECG(:,evt_MR_Pu{4,1}:end));']);
% clear *mff* evt_MR_Pu

% load('hara04_0216_1955_Block1.mat', 'Packet');
% load('morishita05_0219_2011_Block3.mat', 'Packet');
% load('morishita04_0219_1937_Block2.mat', 'Packet');
% load('noguchi03_0325_1911_Block3.mat', 'Packet');
% load('noguchi04_0325_1933_Block4.mat', 'Packet');
% load('noguchi05_0325_1953_Block5.mat', 'Packet');
% PKTsimulate = Packet(1000:end,:);

ECGsign = 1;
% ECGsign = -1;

%% SetParameter

%%% figure

%%%% laptop no fb
% pos1 = [0 0 1920 1080];   pos2 = [2320 0 400 600];   pos3 = [1930 0 400 600];   fsize = 100;

%%%% laptop w/ fb
% pos1 = [0 0 960 1080];    pos2 = [960 0 960 1080];   pos3 = [1930 0 400 600];   fsize = 100;

%%%% goggles no fb(下がメイン)
% pos1 = [1920 0 800 600];  pos2 = [430 420 400 600];  pos3 = [1090 50 800 900];  fsize = 50;
% pos1 = [2500 0 960 963];  pos2 = [430 420 400 600];  pos3 = [1090 50 800 900];  fsize = 50;
% pos1=[2000 400 1920 963];  pos2 = [430 420 400 600];  pos3 = [1090 50 800 900];  fsize = 50;

%%%% goggles w/ fb
% pos1 = [1920 0 400 600];  pos2 = [2320 0 400 600];   pos3 = [1090 50 800 450];  fsize = 50;
% pos1 = [1921 41 960 963];  pos2 = [2881 41 960 963];   pos3 = [1090 50 800 450];  fsize = 50;

%%%% laptop one screen
% pos1 = [30 420 400 600];  pos2 = [430 420 400 600];  pos3 = [1090 50 800 900];  fsize = 50;

%%%% saiseikai second screen
% pos1 = [1920 0 1920 1080];  pos2 = [430 420 400 600];   pos3 = [1090 50 800 900];  fsize = 100;

%%%% 5F second screen
pos1 = [1280 -250 1950 2200];  pos2 = [430 0 400 600];   pos3 = [640 0 640 700];  fsize = 100;

%%%% 5F first screen
% pos1 = [0 0 1280 780];  pos2 = [430 0 400 600];   pos3 = [640 0 640 800];  fsize = 100;

%%%% KiPAS second screen
% pos1 = [1600 0 1600 1080];  pos2 = [430 420 400 600];   pos3 = [800 0 800 900];  fsize = 100;



% pos1 = [1600 1 800 900];  pos2 = [2400 1 800 900];  pos3 = [1 50 1000 400];  fsize = 100;

% pos1 = [1600 1 800 900];  pos2 = [2400 1 800 900];  pos3 = [1 50 1000 400];  fsize = 100;

% pos1 = [1600 1 1600 900];  pos2 = [1000 1 100 100];  pos3 = [1 50 1000 400];  fsize = 100;


%%% NI DAQ

%%%% Saiseikai_newpc(main)
% Dev_num = 'Dev3';

%%%% 5F(test)
Dev_num = 'Dev1';

%%%% KiPAS-newsystem-laptop
% Dev_num = 'Dev2';

%%%% KiPAS-desktop
% Dev_num = 'Dev5';


%%% set parameter

Fs          = 1000;
fs          = 200;

% ch          = [29 30 35 36 37 41 42];       % right small lap
% ch          = [87 93 103 104 105 110 111];  % left small lap
% ch          = [7 20 34 36 46 52 54];           % right large lap
% ch          = [7 13 20 28 31 34 36 40 46 47 52 53 54]; % right large lap2 13ch
% ch          = [9 11 22 24 33 36 45 52 58 62 70 75 83 92 96 104 108 122 124]; % 19ch
% % ch          = [9 11 22 24 33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122 124]; % 21ch
% ch          = [33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122]; % 16ch noteye
% % ch          = 33:64;
% roi         = 36;

TR_num      = 200;
TR_sample   = 3000;

trial_num   = 20;
t_blank1    = 6;
t_rest      = 9;
t_ref       = 9;
t_ready     = 0;
t_task      = 9;
t_blank2    = 0;

calc_sample = 0.1 * Fs;

AASnum      = 4;   % number of average artifact subtraction
AASsize     = Fs;
% AASsize     = calc_sample;
AASinterval = 0.1 * Fs;
% intervalsize = TR_sample;

OBSnum      = 30;
BCGsize     = 0.8 * Fs;
pcnum       = 4;

n           = 3;
Band        = [3,95];
notch       = 50;

freq_fb     = 8:12;  % Hz
fb_min      = -100;  % percent ERS

%%% initializetion & setting

trial_count = 1;
calc_count  = 0;
Rcount      = 0;
Rcount2     = 0;

% Mov = zeros(3,1);
Mov = zeros(10,1);


%%%%

type_fb  = get(UI21,'value');

type_tr  = get(UI22,'value');

type_gra = get(UI23,'value');

type_bcg = get(UI24,'value');

type_fb2 = get(UI25,'value');

%%%%

% ch          = [33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122]; % 16ch noteye
ch          = [129 7 106 31 55 80 6 112 105 87 79 54 37 30 13 12 5 118 111 104 93 86 78 62 61 53 42 36 29 20 11 4 124 117 110 103 98 92 85 77 72 67 60 52 47 41 35 28 24 19 3 123 116 109 102 97 91 84 76 71 66 59 51 46 40 34 27 23 65 64 90 95 70 75 83 69 74 82 89];
roi         = 36;

%%%%
disp1 = figure(101); clf(disp1);
set(disp1,'color',[0 0 0],'position',pos1,'menu','none','toolbar','none');
if type_fb2 == 1
%     plot_t = plot(4,4,'k.','MarkerSize',50);
    str1 = text(4,4,'','fontsize',fsize,'fontname','Arial','color','y','FontWeight','bold',...
        'HorizontalAlignment','center');
    axis off; axis tight;
    xlim([0 8]); ylim([0 8]);
elseif type_fb2 == 2
    hold on;
    str1 = text(3,-30,'','fontsize',fsize,'fontname','Arial','color','y','FontWeight','bold',...
        'HorizontalAlignment','center');
    line0    = line([1 5],[0 0],'color','r','LineWidth',4);
    line1    = line([1 2.5],[0 0],'color','g','LineWidth',4);
    line2    = line([3.5 5],[0 0],'color','g','LineWidth',4);
    plot00    = bar(3,0,'r','BarWidth',1,'LineStyle','none');
    baseline = get(plot00,'BaseLine');
    set(baseline,'LineStyle','none');
%     plot_t = plot(2,-50,'w.','MarkerSize',50);
    axis tight; axis off; xlim([0 6]); ylim([-100 100]); hold off;
    drawnow;
end

disp2 = figure(102); clf(disp2);
set(disp2,'color',[0 0 0],'position',pos2,'menu','none','toolbar','none');


if     type_fb == 1
    cd ./hand;  %相対パス
    pngFiles     = dir('*.PNG');
    imgnum       = length(pngFiles);
    imghand      = cell(1,imgnum);
    for k = 1:imgnum
        imghand{k} = imread(pngFiles(k).name);
    end
    cd ../; clear k pngFiles imgnum;
    img1         = imshow(imghand{1},'border','tight');
    set(disp2,'position',pos2);
    
elseif type_fb == 2
    hold on;
    line0    = line([1 5],[0 0],'color','r','LineWidth',4);
    line1    = line([1 2.5],[0 0],'color','g','LineWidth',4);
    line2    = line([3.5 5],[0 0],'color','g','LineWidth',4);
    plot0    = bar(3,0,'r','BarWidth',1,'LineStyle','none');
    baseline = get(plot0,'BaseLine');
    set(baseline,'LineStyle','none');
    axis tight; axis off; xlim([1 6]); ylim([-100 100]); hold off;
end

drawnow;


%%%%

ch_num          = size(ch,2);

T               = zeros(2,6);
T(1,:)          = [t_blank1, t_rest, t_ref, t_ready, t_task, t_blank2];
T(2,:)          = [T(1,1), T(1,1)+T(1,2)-T(1,3), T(1,1)+T(1,2), T(1,1)+T(1,2)+T(1,4), ...
    T(1,1)+T(1,2)+T(1,4)+T(1,5), T(1,1)+T(1,2)+T(1,4)+T(1,5)+T(1,6)];
clear t_blank1 t_rest t_ref t_ready t_task t_blank2;

GRAone        = ones(AASsize,1);
% BCGOne          = ones(BCGsize,1);

[BandB,BandA]   = butter(n,Band/(fs/2),'bandpass');
[NotchB,NotchA] = butter(n,[notch-1,notch+1]/(fs/2),'stop');
% [B,A]           = butter(n,[0.1 45]/(Fs/2),'bandpass');
h               = hanning(fs);
H               = repmat(h,[1,ch_num]);

freq_fb         = freq_fb + 1;


%%% Set NI

D             =  daq.createSession('ni');

D.addAnalogOutputChannel(Dev_num, [0 1 2 3], 'voltage');

OutputSignal  =  [5, 0, 0, 0;  0, 5, 0, 0;  5, 5, 0, 0;  0, 0, 5, 0; ...
    5, 0, 5, 0;  0, 5, 5, 0;  5, 5, 5, 0;  0, 0, 0, 5; ...
    5, 0, 0, 5;  0, 5, 0, 5;];                              % DIN1~10


%%% GetData_Parameter

%%%% Parameter for GetData_NA400ver164

count_sample  = 0;
count_accum   = 0;
PacketSize    = 1264;

EEGi          = 1:4:516;  % calculating data each 4 byte
EMGi          = 1:4:32;
ECGi          = 1;
TRi           = 1;

TRTrigger     = zeros(6e5,1);
for i=1:TR_num
    TRTrigger(TR_sample*i+1:TR_sample*i+10,1) = ones(10,1);
end


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
% ARwave = zeros(round(datasize/(Fs/fs)),1);
% BufferB    = zeros(BCGsize,BCGnum+1,ch_num);






%%%% Coefficient to change binary data to decimal data

coef_header = [2^56; 2^48; 2^40; 2^32; 2^24; 2^16; 2^8; 2^0;];  % u64, BigEndian, 8x1
coef_EEG    = repmat([2^0 2^8 2^16 2^24],[50,129]);             % u32, LittleEndian, 50x516
coef_EMG    = repmat([2^0 2^8 2^16 2^24],[50,8]);               % u32, LittleEndian, 50x32
coef_ECG    = repmat([2^0 2^8 2^16 2^24],[50,1]);               % u32, LittleEndian, 50x4
coef_TR     = repmat([2^0 2^8 2^16 2^24],[50,1]);               % u32, LittleEndian, 50x4

%%%%

Ref0     = zeros(fs,(T(1,3)-1)*Fs/calc_sample);
AfterRem = zeros(T(2,6)*(trial_num+1)*Fs,ch_num+1);
Power    = zeros(T(2,6)*Fs/calc_sample,trial_num);
TF       = zeros(notch+1,T(2,6)*Fs/calc_sample,trial_num);
TP       = zeros(notch+1,ch_num,T(2,6)*Fs/calc_sample,trial_num);
Packet   = zeros(6e5+3e3,PacketSize);

%% MainProgram

ti2 = ListenAmpserver;

disp0 = figure(99); clf(disp0);
set(disp0,'position',pos3); dispnum = 6;
subplot(dispnum,1,1); plot01 = plot((1:Fs)/Fs,zeros(Fs,1));
subplot(dispnum,1,2); plot02 = plot((1:Fs)/Fs,zeros(Fs,1));
ylim([0 1]);
subplot(dispnum,1,3); plot03 = plot((1:fs)/fs,zeros(fs,1));
ylim([-1 1]*30);
subplot(dispnum,1,4); plot04 = plot(0:fs-1,zeros(fs,1));
xlim([0 50]);
disp05 = subplot(dispnum,1,5);
plot05 = plot(0:T(2,6)/(T(2,6)*Fs/calc_sample-1):T(2,6),Power(:,1));
xlim([0 T(2,6)]);
hold on; plot051 = plot([0 T(2,6)],[0 0],'r');
subplot(dispnum,1,6); plot06 = plot((1:fs)/fs,zeros(fs,1));
ylim([-1 2]*1e3);
for i=1:dispnum
    subplot(dispnum,1,i);
    set(gca,'fontsize',10);
end

while recordingtag ~= 0
    if trial_count <= trial_num
        %% GetData_NA400ver164
        
        %%% Main
        
        Header         = fread(ti2,16);
        Header_decimal = Header(9:16,:) .* coef_header;
        Header_Output  = Header_decimal(1,1) + Header_decimal(2,1) ...
            + Header_decimal(3,1) + Header_decimal(4,1) ...
            + Header_decimal(5,1) + Header_decimal(6,1) ...
            + Header_decimal(7,1) + Header_decimal(8,1);
        sample_num     = Header_Output / PacketSize;
        
        if sample_num > 50  % if coefficient size is over, set enough size to calculate
            coef_EEG   = repmat([2^0 2^8 2^16 2^24],[sample_num,129]);  % u32, Little Endian
            coef_EMG   = repmat([2^0 2^8 2^16 2^24],[sample_num,8]);    % u32, Little Endian
            coef_ECG   = repmat([2^0 2^8 2^16 2^24],[sample_num,1]);    % u32, Little Endian
            coef_TR    = repmat([2^0 2^8 2^16 2^24],[sample_num,1]);    % u32, Little Endian
        end
        
        
        rowSamples     = fread(ti2,PacketSize*sample_num)';
        
        %%%% unsigned
        %     Samples        = rowSamples(bsxfun(@plus,PacketSize*(0:sample_num-1)',(1:PacketSize)));
        
        %%%% signed
        Samples1          = 1:PacketSize;
        Samples2          = ones(sample_num,PacketSize);
        Samples2(1,:)     = Samples1;
        for i=2:sample_num
            Samples2(i,:) = Samples1+PacketSize*(i-1);
        end
        Samples           = rowSamples(Samples2);
        
        if exist('PKTsimulate','var')
            Samples = PKTsimulate(calc_count*calc_sample+count_sample+1:...
                calc_count*calc_sample+count_sample+sample_num,:);
        end
        
        EEG_decimal    = Samples(:,81:596)    .* coef_EEG(1:sample_num,:);
        EMG_decimal    = Samples(:,1137:1168) .* coef_EMG(1:sample_num,:);
        
        % ECG_decimal    = Samples(:,81:84)     .* coef_ECG(1:sample_num,:);  % eeg ch.1
        ECG_decimal    = Samples(:,1113:1116) .* coef_ECG(1:sample_num,:);  % ECG
        
        TR_decimal     = Samples(:,3)         .* coef_TR(1:sample_num,1);
        
        s              = 1:1:sample_num;
        
        EEG_Output     = EEG_decimal(s,EEGi)   + EEG_decimal(s,EEGi+1) ...
            + EEG_decimal(s,EEGi+2) + EEG_decimal(s,EEGi+3);
        EMG_Output     = EMG_decimal(s,EMGi)   + EMG_decimal(s,EMGi+1) ...
            + EMG_decimal(s,EMGi+2) + EMG_decimal(s,EMGi+3);
        ECG_Output     = ECG_decimal(s,ECGi)   + ECG_decimal(s,ECGi+1) ...
            + ECG_decimal(s,ECGi+2) + ECG_decimal(s,ECGi+3);
        TR_Output      = TR_decimal(s,TRi);
        
        %%%% signed
        EEG_Output(EEG_Output>=2^31) = EEG_Output(EEG_Output>=2^31)-(2^32);
        ECG_Output(ECG_Output>=2^31) = ECG_Output(ECG_Output>=2^31)-(2^32);
        
        
        new_EEGData    = EEG_Output *  0.00009313225;
        new_EMGData    = EMG_Output * -0.00111758708;
        new_ECGData    = ECG_Output *  0.00009313225;
        
        if exist('EEGsimulate','var')
            new_EEGData = EEGsimulate(calc_count*calc_sample+count_sample+1:...
                calc_count*calc_sample+count_sample+sample_num,:);
        end
        if exist('ECGsimulate','var')
            new_ECGData = ECGsimulate(calc_count*calc_sample+count_sample+1:...
                calc_count*calc_sample+count_sample+sample_num,:);
        end
        
        if     type_tr == 1
            new_TRData = TRTrigger(calc_count*calc_sample+count_sample+1:...
                calc_count*calc_sample+count_sample+sample_num,1);
        elseif type_tr == 2
            new_TRData = TR_Output;
        end
        
        Packet(calc_count*calc_sample+count_sample+1:...
            calc_count*calc_sample+count_sample+sample_num,:) = Samples;
        
        count_sample   = count_sample + sample_num;
        
        
        %%% Update Buffer
        
        Buffer0(1:end-sample_num,:)     = Buffer0(1+sample_num:end,:);
        Buffer0(end-sample_num+1:end,:) = [new_EEGData(:,ch),new_ECGData,new_TRData];
        
        %%% Check TR Trigger
        
        if recordingtag == 1 && sum(new_TRData) ~= 0
            recordingtag = 2;
            count_sample = sample_num - find(new_TRData,1) + 1;
            
            D.queueOutputData(OutputSignal(1,:));
            D.startBackground();
        end
        
        
        %%
        if recordingtag >= 2 && count_sample >= calc_sample
            %% Signal
            
            Buffer01                         = detrend(Buffer0(:,1:end-1));
            Buffer1(1:end-count_sample,:)    = Buffer1(1+count_sample:end,:);
            
            % Buffer1(end-calc_sample+1:end,:) = ...
            %     [Buffer01(end-count_sample+1:end-count_sample+calc_sample,:),...
            %      Buffer0(end-count_sample+1:end-count_sample+calc_sample,end)];
            
            Buffer1(end-calc_sample+1:end,:) = ...
                Buffer0(end-count_sample+1:end-count_sample+calc_sample,:);
            
            if     type_gra == 1  % not removing gradient artifact
                
                Buffer2(1:end-calc_sample,:)     = Buffer2(1+calc_sample:end,:);
                Buffer2(end-calc_sample+1:end,:) = Buffer1(end-calc_sample+1:end,1:end-1);
                
                
            elseif type_gra == 2  % removing gradient artifact
                if recordingtag == 2
                    if calc_count * calc_sample >= AASsize + AASinterval
                        recordingtag = 3;
                    end
                elseif recordingtag == 3
                    if  calc_count * calc_sample >= AASsize + AASinterval * AASnum
                        recordingtag = 4;
                    end
                end
                
                Buffer11(1:end-calc_sample,:)     = Buffer11(calc_sample+1:end,:);
                Buffer11(end-calc_sample+1:end,:) = Buffer1(end-calc_sample+1:end,1:ch_num+1);
                
                GRAtemp = zeros(AASsize,ch_num+1);
                
                if recordingtag >= 3
                    if recordingtag == 3
                        for i=1:(calc_count*calc_sample-AASsize)/AASinterval
                            %                     GRAtemp = GRAtemp + Buffer1(end-AASinterval*i-AASsize+1:end-AASinterval*i,1:end-1);
                            GRAtemp = GRAtemp + Buffer11(AASinterval*(i-1)+1:AASinterval*(i-1)+AASsize,:);
                        end
                        GRAtemp = GRAtemp / (calc_count*calc_sample-AASsize) * AASinterval;
                        
                    elseif recordingtag == 4
                        for i=1:AASnum
                            %                     GRAtemp = GRAtemp + Buffer1(end-AASinterval*i-AASsize+1:end-AASinterval*i,1:end-1);
                            GRAtemp = GRAtemp + Buffer11(AASinterval*(i-1)+1:AASinterval*(i-1)+AASsize,:);
                        end
                        GRAtemp = GRAtemp / AASnum;
                    end
                    
                    for i=1:ch_num+1
                        [~,~,Buffer12(:,i)] = regress(Buffer11(end-AASsize+1:end,i),[GRAone,GRAtemp(:,i)]);
                    end
                    
                    Buffer2(1:end-calc_sample,:)     = Buffer2(1+calc_sample:end,:);
                    Buffer2(end-calc_sample+1:end,:) = Buffer12(end-calc_sample+1:end,:);
                end
                
            end
            
            %%% subtract BCG artifact
            
            Buffer21 = -Buffer2(1:Fs/fs:end,:);
            
            Buffer22(1:end-calc_sample/Fs*fs,:)     = Buffer22(1+calc_sample/Fs*fs:end,:);
            Buffer22(end-calc_sample/Fs*fs+1:end,:) = Buffer21(end-calc_sample/Fs*fs+1:end,1:ch_num);
            
            if     type_bcg == 1
                
            elseif type_bcg == 2
                %     Buffer21(:,end) = filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,Buffer21(end-fs*2+1:end-fs,end)));
                Buffer21(:,end) = ECGsign*filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,Buffer21(:,end)));
                
                if exist('Lrt','var') ~= 1 &&  calc_count * calc_sample > AASsize + AASinterval * AASnum
                    %         if max(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end)) < -min(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end))
                    %             ECGsign = -1 * ECGsign;
                    %             Buffer21(:,end) = -Buffer21(:,end);
                    %         end
                    [pks,QRS] = findpeaks(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end),...
                        'minpeakdistance',min(0.4*fs,(calc_count*calc_sample-AASsize)/Fs*fs-2),'minpeakheight',600);
                    if max(pks)>3e3
                        QRS(pks>3e3)=[];
                        pks(pks>3e3)=[];
                    end
                    if size(QRS,1) >= 2
                        Lrt = round((QRS(end)-QRS(1))/(size(QRS,1)-1)/2)*2;
                        %             if max(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end)) < -min(Buffer21(end-(calc_count*calc_sample-AASsize)/Fs*fs+1:end,end))
                        %                 ECGsign = -1 * ECGsign;
                        %                 Buffer21(:,end) = -Buffer21(:,end);
                        %             end
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
                
            end
            
            Buffer = Buffer22(end-2*fs+1:end-fs,:);
            
            % AfterRem(calc_sample*calc_count+1:calc_sample*(calc_count+1),:) = Buffer(end-calc_sample+1:end,:);
            count_accum  = count_accum + count_sample;
            count_sample = count_sample - calc_sample;
            calc_count   = calc_count + 1;
            time_count   = mod(calc_count*calc_sample,T(2,6)*Fs)/Fs;
            
            %%% filtering
            
            % % Signal0 = Buffer(:,4) - (Buffer(:,1) + Buffer(:,2) + Buffer(:,3) +  Buffer(:,5) + Buffer(:,6) + Buffer(:,7))/6;
            % Signal0 = Buffer(:,ch==roi) - mean(Buffer(:,1:end-1),2);
            % % Signal0 = Buffer(:,ch==roi);
            % Signal0 = filtfilt(BandB,BandA,Signal0);
            % Signal0 = filtfilt(NotchB,NotchA,Signal0);
            
            Buffer = filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,Buffer));
            
            Signal00 = Buffer-repmat(mean(Buffer(:,ch~=roi),2),1,ch_num); %CAR
            Signal_allch = Signal00.* H;
            Signal_allch = fft(Signal_allch);
            Signal_allch = abs(Signal_allch) .^ 2;
            
            Signal0 =Buffer(:,ch==roi) - mean(Buffer,2); %変更前mean(Buffer(:,ch~=roi),2)
            ARwave(1+fs*(calc_count-1):fs*calc_count) = Signal0;
            Signal  = Signal0 .* h;
            Signal  = fft(Signal);
            Signal  = abs(Signal) .^ 2;
            
            Power(time_count*10+1,trial_count) = mean(Signal(freq_fb));
            TP(:,:,time_count*10+1,trial_count) = Signal_allch(1:notch+1,:);
            TF(:,time_count*10+1,trial_count)  = Signal(1:notch+1);
            
            
            %% main
            
            set(plot01,'ydata',Buffer1(1:Fs,ch==roi)); %トレンド除去だけやった36ch波形
            set(plot02,'ydata',Buffer1(1:Fs,end)); %
            set(plot03,'ydata',Signal0); %
            set(plot04,'ydata',Signal); %
            set(plot05,'ydata',Power(:,trial_count)); %
            set(plot06,'ydata',Buffer21(end-fs+1:end,end)); %
            drawnow;
            
            if trial_count >= 1
                if time_count == T(2,1)-1
                    %% Rest moji
                    
                    % D.queueOutputData(OutputSignal(2,:));
                    % D.startBackground();
                    set(str1,'string',['Rest ',num2str(trial_count)],'color','g');
                    
                    % if trial_count == 1
                    %     set(str1,'string','Open Eyes','color','g');
                    %     drawnow;
                    % end
                    
                end
                if time_count == T(2,1)
                    %% Rest din
                    
                    D.queueOutputData(OutputSignal(2,:));
                    D.startBackground();
                    % set(str1,'string',['Rest ',num2str(trial_count)],'color','g');
                    
                    % if trial_count == 1
                    %     set(str1,'string','Open Eyes','color','g');
                    %     drawnow;
                    % end
                    
                end
                
                if time_count > T(2,2) && time_count <= T(2,4)
                    %% Reference
                    
                    Ref0(:,round((time_count-T(2,2))*10)) = Signal;
                    
                    
                end
                
                if time_count == T(2,3)
                    %% Ready
                    
                    % set(str1,'string','Ready','color','y');
                    % drawnow;
                    
                end
                
                if time_count >= T(2,4) && time_count < T(2,5)
                    %% Task
                    
                    if time_count == T(2,4)
                        D.queueOutputData(OutputSignal(3,:));
                        D.startBackground();
                        
                        Ref     = mean(Ref0,2);
                        Mean051 = mean(Ref(freq_fb));
                        set(plot051,'ydata',[Mean051 Mean051]);
                        set(disp05,'ylim',[0 max(1,Mean051*2)]);
                        
                        
                        if type_fb2 == 1
                             set(str1,'string','Imagery','color','r');
                        elseif type_fb2 == 2
                             set(str1,'string','','color','r');
                        end
                        drawnow;
                        
                        %     if trial_count == 13
                        %     set(str1,'string','Close Eyes','color','r');
                        %     drawnow;
                        %     end
                        
                    end
                    
                    ERD          = (Signal - Ref) ./ Ref * 100;
                    Mov(1:end-1) = Mov(2:end);
                    Mov(end)     = mean(ERD(freq_fb));
                    value        = max(min(-fb_min,mean(Mov)),-100);
                    
                    if     type_fb == 1
                        if value >= 0
                            set(img1,'CData',imghand{1});
                        else
                            imgnum = min(ceil(-value/4)+1,21);
                            %         imgnum = ceil(-value/5)+1;
                            set(img1,'CData',imghand{imgnum});
                        end
                        
                    elseif type_fb == 2
                        set(plot0,'ydata',-value,'xdata',3);
                        if type_fb2 == 2
                            set(plot00,'ydata',-value,'xdata',3);
                        end
                    end
                    drawnow;
                    
%                     if mod(count_accum,1600)<800
%                         set(plot_t,'color','k');%w
%                     elseif mod(count_accum,1600)>=800
%                         set(plot_t,'color','k');
%                     end
                end
                
                if time_count == T(2,5)
                    close figure 1000
                    %% Blank
                    
                    % D.queueOutputData(OutputSignal(4,:));
                    % D.startBackground();
                    %
                    %
                    % set(str1,'string','');
                    %
                    % if     type_fb == 1
                    %     set(img1,'CData',imghand{1});
                    % elseif type_fb == 2
                    %     set(plot0,'ydata',0,'xdata',2500);
                    % end
                    % drawnow;
                    
                    
                end
            end
            
            if time_count == 0
                %             if time_count == T(2,6)
                %% Reset trial
                
                D.queueOutputData(OutputSignal(4,:));
                D.startBackground();
%                 if type_fb2 == 1
%                     set(plot_t,'color','k');drawnow;
%                 elseif type_fb2 == 2
%                     set(plot_t,'color','k');drawnow;%w
%                 end
                set(str1,'string','Break','color','b');
                
                if     type_fb == 1
                    set(img1,'CData',imghand{1});
                elseif type_fb == 2
                    set(plot0,'ydata',0,'xdata',2500);
                    if type_fb2 == 2
                        set(plot00,'ydata',0,'xdata',2500);
                    end
                end
                drawnow;
                
                trial_count = trial_count + 1;
                Ref0        = Ref0 * 0;
                Mov         = Mov  * 0;
                
            end
        end
        
    else
        break
    end
end

fclose(ti2);

TFcut  = TF(:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
ref = repmat(mean(TFcut(:,1:T(1,3)*Fs/calc_sample,:),2),[1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
ER  = (TFcut - ref)./ref * 100;
if trial_count>=3
    figure(100); clf(gcf); set(gcf,'position',pos3);
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

% run('ChannnelLocation.m');
% TPcut  = TP(:,:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
% ref2 = repmat(mean(TPcut(:,:,1:T(1,3)*Fs/calc_sample,:),3),[1,1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
% ER2 = (ref2 - TPcut)./ref2 * 100;   %[f ch window trial]
% ERP_sort = permute(ER2,[1 3 2 4]);   %[f window ch trial]
% temp = ERP_sort(:,T(1,2)*Fs/calc_sample+1:end,:,:);        % range幅のERPを抜き出す　[f window ch trial]
% ERP_mean = squeeze(mean(temp,2));     % trial、時間方向の平均を計算する [f ch trial]
% temp_alpha = ERP_mean(9:14,:,:);   % FOI(α)
% ERP_alpha = squeeze(mean(temp_alpha,1))';
% 
% figure(200); clf(gcf); set(gcf,'position',[50,300,1800,400]);
% for i=2:trial_count-1
%     subplot(8,6,i-1);
%     topography(ERP_alpha(i+1,:),loc,3);
%     c=jet;
%     c=flipud(c);
%     colormap(c);
%     c=colorbar;
%     c.Label.String='ERD,%';
%     caxis([-100 100]);
%     title('8-13 Hz');
%     set(gca,'FontSize',20,'FontName','Helvetica')
% end
% 
% ERP_alpha_alltrial = squeeze(mean(ERP_alpha,1));
% subplot(8,6,25:48)
% topography(ERP_alpha_alltrial,loc,3);
% c=jet;
% c=flipud(c);
% colormap(c);
% c=colorbar;
% c.Label.String='ERD,%';
% caxis([-100 100]);
% set(gca,'FontSize',14,'FontName','Helvetica')


close figure 101 figure 102

% % save([get(UI13,'string'),'_',datestr(now,'mmdd_HHMM'),'_Block',num2str(BlockCount)],'Power');
% % save([get(UI13,'string'),'_',datestr(now,'mmdd_HHMM'),'_Block',num2str(BlockCount)],'Power','AfterRem','TF','Packet','-v7.3');

save([get(UI13,'string'),'_',datestr(now,'mmdd_HHMM'),'_Block',num2str(BlockCount)],'Power','TF','Packet','-v7.3')

BlockCount = BlockCount + 1;
set(UI11,'string',['Block ',num2str(BlockCount)]);
stop(D);