clear all
close all

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
trial_count = 20;

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
fb_min      = -100;  % percent ERS
ch          = [33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122];
% ch          = 1:129;
ch_num      = 129;
h               = hanning(fs);
H               = repmat(h,[1,ch_num]);
GRAtemp = zeros(AASsize,ch_num+1);
% Power    = zeros(T(2,6)*Fs/calc_sample,trial_num);
% TF       = zeros(notch+1,T(2,6)*Fs/calc_sample,trial_num);
% TP       = zeros(notch+1,ch_num,T(2,6)*Fs/calc_sample,trial_num);
pos3 = [1090 50 600 450];
% pos3 = [1090 50 800 900];
freq_fb         = freq_fb + 1;
chosen_trial = [2:20];

for j=1
    %     dir = ('G:\脳波データ(MATLAB保存)\2019年\0203'); %フォルダ識別
    dir = ('G:\脳波データ(済生会AF除去)');
    data_mat = ['hosoda',num2str(j)];
    load([dir,'\',data_mat]); %データ読み取り
    
    
    
    TFcut  = TF(:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
    % TFcut = TF;
    ref = repmat(mean(TFcut(:,1:T(1,3)*Fs/calc_sample,:),2),[1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
    ER  = (ref - TFcut)./ref * 100;
    
    % ERD_ave=zeros(20,2);
    % for i=1:trial_count
    %     ERD_ave(i,1)=i;
    %     ERD_freq=squeeze(mean(ER(8:12,:,i),1));
    %     ERD_ave(i,2)=mean(ERD_freq(91:180));
    % end
    %
    % ERD_sort=sort(ERD_ave(:,2),'descend');
    % ERD_sort=ERD_sort(1:10);
    % Good_trial=zeros(10,1);
    % for i=1:10
    %     for j=1:trial_count
    %         if ERD_sort(i)==ERD_ave(j,2)
    %             Good_trial(i)=ERD_ave(j,1);
    %             break;
    %         end
    %     end
    % end
    % Good_trial=sort(Good_trial);
    %
    % Task_condition_Rest=zeros(1,20);
    % Task_condition_Task=zeros(1,20);
    %
    % for i=1:trial_count
    %     Task_condition_Rest(i)=3+8*(i-1);
    %     Task_condition_Task(i)=6+8*(i-1);
    % end
    %
    % Good_scan_Rest=zeros(1,10);
    % Good_scan_Task=zeros(1,10);
    %
    % for i=1:10
    %     Good_scan_Rest(i)=Task_condition_Rest(Good_trial(i));
    %     Good_scan_Task(i)=Task_condition_Task(Good_trial(i));
    % end
    %
    % Good_scan_Rest
    % Good_scan_Task
    % Good_trial'
    
    
    figure(j+10); clf(gcf); set(gcf,'position',pos3);
    for i=2:trial_count
        subplot(4,5,i-1);
        imagesc(0:18,0:50,ER(:,:,i));
        set(gca,'ydir','normal','clim',[-100 100],'fontsize',10);
        cc=jet;
        cc=flipud(cc);
        colormap(cc);
        cc=colorbar;
        cc.Label.String='ERD,%';
        caxis([-100 100]);
        line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
        xlabel('Time (s)');
        ylabel('Frequency (Hz)');
        drawnow;
        %         set(gca,'ydir','normal','clim',[-100 100],'fontsize',10); colormap('jet');
    end
    ERD_denoise=mean(ER(:,:,chosen_trial),3);
    figure(j+100); clf(gcf); set(gcf,'position',pos3);
    imagesc(0:18,0:50,ERD_denoise);
    set(gca,'ydir','normal','clim',[-100 100],'fontsize',20);
    c=jet;
    c=flipud(c);
    colormap(c);
    c=colorbar;
    c.Label.String='ERD,%';
    caxis([-100 100]);
    line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
    set(gca,'FontSize',20,'FontName','Helvetica')
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    drawnow;
    
    
    
    
    
    run('ChannnelLocation.m');
    TPcut  = TP(:,:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
    ref2 = repmat(mean(TPcut(:,:,1:T(1,3)*Fs/calc_sample,:),3),[1,1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
    ER2 = (ref2 - TPcut)./ref2 * 100;   %[f ch window trial]
    
    ERP_eachtrial = permute(ER2,[1 3 2 4]); %[f window ch trial]
    temp_each = ERP_eachtrial(:,T(1,2)*Fs/calc_sample+1:end,:,:); %[f window ch trial]
    ERP_mean_each = squeeze(mean(temp_each,2)); %[f ch trial]
    temp_alpha_each = ERP_mean_each(freq_fb,:,:); %[f ch trial]
    ERP_alpha_each = squeeze(mean(temp_alpha_each,1)); %[ch trial]
    
    figure(j+20); clf(gcf); set(gcf,'position',[50,0,1700,1000]);
    for i=2:trial_count
        subplot(4,5,i-1);
        topography(ERP_alpha_each(:,i),loc,3);
        c=jet;
        c=flipud(c);
        colormap(c);
        c=colorbar;
%         c.Label.String='ERD,%';
        caxis([-100 100]);
        title([num2str(freq_fb(1)-1),'-',num2str(freq_fb(end)-1),' Hz']);
        set(gca,'FontSize',30,'FontName','Helvetica')
    end
    
    
    
    ERP_alltrial = mean(ER2(:,:,:,chosen_trial),4,'omitnan');     %[f ch window]
    ERP_alltrial = permute(ERP_alltrial,[1 3 2]);   %[f window ch]
    temp = ERP_alltrial(:,T(1,2)*Fs/calc_sample+1:end,:);        % range幅のERPを抜き出す　[f window ch]
    ERP_mean = squeeze(mean(temp,2));     % trial、時間方向の平均を計算する [f ch]
    temp_alpha = ERP_mean(freq_fb,:);   % FOI(α)
    % temp_lowbeta = ERP_mean(13:22,:); %FOI(lowβ)
    % temp_highbeta = ERP_mean(23:31,:); %FOI(highβ)
    ERP_alpha = mean(temp_alpha,1)';
    % ERP_lowbeta = mean(temp_lowbeta,1)';
    % ERP_highbeta = mean(temp_highbeta,1)';
    % ERP_foi = ERP_foi.';
    %
    % run('ChannnelLocation.m');
    % TPcut  = TP(:,:,T(2,2)*Fs/calc_sample+1:T(2,5)*Fs/calc_sample,:);
    % ref2 = repmat(mean(TPcut(:,:,1:T(1,3)*Fs/calc_sample,:),3),[1,1,(T(2,5)-T(2,2))*Fs/calc_sample,1]);
    % ER2 = (ref2 - TPcut)./ref2 * 100;   %[f ch window trial]
    % % ERP_alltrial = mean(ER2,4);     %[f ch window]
    % ERP_alltrial = permute(ER2,[1 3 2 4]);   %[f window ch trial]
    % temp = ERP_alltrial(:,T(1,2)*Fs/calc_sample+1:end,:,:);        % range幅のERPを抜き出す　[f window ch trial]
    % ERP_mean = squeeze(mean(temp,2));     % trial、時間方向の平均を計算する [f ch trial]
    % temp_alpha = ERP_mean(9:14,:,:);   % FOI(α)
    % temp_lowbeta = ERP_mean(15:22,:,:); %FOI(lowβ)
    % temp_highbeta = ERP_mean(23:31,:,:); %FOI(highβ)
    % ERP_alpha = squeeze(mean(temp_alpha,1))';
    % ERP_lowbeta = squeeze(mean(temp_lowbeta,1))';
    % ERP_highbeta = squeeze(mean(temp_highbeta,1))';
    % % ERP_foi = ERP_foi.';
    %
    % figure(400)
    % for i=1:19
    %     subplot(5,4,i)
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
    
    figure(j+30); clf(gcf); set(gcf,'position',[50,300,500,400]);
    % subplot(1,3,1);
    topography(ERP_alpha,loc,3);
    c=jet;
    c=flipud(c);
    colormap(c);
    c=colorbar;
%     c.Label.String='ERD,%';
    caxis([-50 50]);
%     title([num2str(freq_fb(1)-1),'-',num2str(freq_fb(end)-1),' Hz']);
    set(gca,'FontSize',30,'FontName','Helvetica')
    
    
    % subplot(1,3,2);
    % topography(ERP_lowbeta,loc,3);
    % c=jet;
    % c=flipud(c);
    % colormap(c);
    % c=colorbar;
    % c.Label.String='ERD,%';
    % caxis([-100 100]);
    % title('12-22 Hz');
    % set(gca,'FontSize',20,'FontName','Helvetica')
    %
    % subplot(1,3,3);
    % topography(ERP_highbeta,loc,3);
    % c=jet;
    % c=flipud(c);
    % colormap(c);
    % c=colorbar;
    % c.Label.String='ERD,%';
    % caxis([-100 100]);
    % title('23-30 Hz');
    % set(gca,'FontSize',20,'FontName','Helvetica')
    
%     save(['kida',num2str(j),'_denoise'],'ERD_denoise','chosen_trial');
end
