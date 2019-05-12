clear all
close all

for j=1:9
    dir = ('G:\脳波データ(矢上)\2019年3月'); %フォルダ識別
%     dir = ('G:\脳波データ(済生会)\2018年12月');
    data_mat = ['hirose',num2str(j)];
    load([dir,'\',data_mat]); %データ読み取り
    temp = whos('*mff');
%     temp2 = whos('*EMG1');
    eval(['data = ',temp(1).name,';']);
%     eval(['EMGdata = ',temp2(1).name,';']);
    
    trial_num = 20; %トライアル回
    
    EEG = double(data); %要素をdouble型に変更
%     EMG = double(EMGdata);
    % Lap = (EEG(13,:)+EEG(34,:)+EEG(46,:)+EEG(53,:))/4;
    % C3raw = EEG(36,:)'-Lap'; %LLap
    % C3raw = EEG(36,:);
%     C3raw=EEG(36,:)-mean(EEG([33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122],:),1);
    C3raw=EEG(36,:)-mean(EEG([129 7 106 31 55 80 6 112 105 87 79 54 37 30 13 12 5 118 111 104,...
                               93 86 78 62 61 53 42 36 29 20 11 4 124 117 110 103 98 92 85 77 72,...
                               67 60 52 47 41 35 28 24 19 3 123 116 109 102 97 91 84 76 71 66 59,...
                               51 46 40 34 27 23 65 64 90 95 70 75 83 69 74 82 89],:),1);
    C3 = C3raw(1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*1); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで
    
    Band                   =   [3 70];
    Wn                     =   Band/(EEGSamplingRate/2); %passband
    [B2,A2]                =   butter(3, Wn); %バンドパスフィルタ
    
    stopBand               =   [49 51];
    stopWn                 =   stopBand/(EEGSamplingRate/2);
    [stopB,stopA]          =   butter(3,stopWn,'stop'); %ノッチフィルタ
    
    EMG_Band               =   [10 70];
    EMG_Wn                 =   [EMG_Band(1) EMG_Band(2)]/(EEGSamplingRate/2);
    [EMGB,EMGA]            =    butter(3, EMG_Wn);
    
    C3filt = filtfilt(stopB,stopA,C3);
    C3filt = filtfilt(B2,A2,C3filt); %detrend必要なしか
%     EMG = filtfilt(stopB,stopA,EMG);
%     EMG = filtfilt(EMGB,EMGA,EMG);
%     EMG = detrend(EMG);
    
    task_start = cell2mat(evt_255_DINs(4,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する
    
    for i = 1:trial_num
        C3_segment(:,i) = C3filt(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
%         EMG_segment(:,i) = EMG(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
    end
    
    alltrial = ones(1,20);
    
    
    disp1 = figure(j+10);
    for i = 1:trial_num
        subplot(4,5,i)
        plot(1:size(C3_segment,1),C3_segment(:,i));
        line([9000 9000],[-20 20],'color','r');
%         ylim([-20 20])
        xlim([0 18000])
        noise = findpeaks(abs(C3_segment(:,i))','MinPeakHeight',20);
        if isempty(noise)==false
            alltrial(i)=0;
        end
            
    end
    set(disp1,'position',[1920 0 1680 970]);

    
%     disp1 = figure(j+10);
%     for i = 1:trial_num
%         subplot(4,5,i)
% %         plot(1:size(EMG_segment,1),EMG_segment(:,i));
%         TempRef_EMG = abs(EMG_segment(1:9000,i));
%         AveEMG = mean(TempRef_EMG);
%         SD     = std(TempRef_EMG);
%         EMGRef = AveEMG+SD*3;
%         findpeaks(EMG_segment(:,i)',EEGSamplingRate,'MinPeakHeight',EMGRef);
% %         line([9000 9000],[-50 50],'color','r');
% %         ylim([-50 50])
% %         xlim([0 18000])
%         set(gca,'ydir','normal','FontName','Helvetica');
%     end
%     set(disp1,'position',[1920 0 1680 970]);
    
    
    H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %窓関数
    window_length = EEGSamplingRate; %1秒窓
    overlap_rate = 0.9; %90%オーバーラップ
    window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %各windowの開始点
    
    
    for i = 1:length(window_start)
        C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2; %[f window_num trial]
    end
    
    ref = repmat(mean(C3_power(:,21:81,:),2),[1,size(C3_power,2),1]); %Referenceの窓平均
    ERD = ((ref-C3_power)./ref)*100; %ERDのパーセンテージ表示
    ERD_average = mean(ERD,3);
    
    
    
    % ERD_ave=zeros(20,2);
    % for i=1:trial_num
    %     ERD_ave(i,1)=i;
    %     ERD_freq=squeeze(mean(ERD(12:20,:,i),1));
    %     ERD_ave(i,2)=mean(ERD_freq(81:171));
    % end
    %
    % ERD_sort=sort(ERD_ave(:,2),'descend');
    % ERD_sort=ERD_sort(1:9);
    % Good_trial=zeros(10,1);
    % for i=1:9
    %     for j=1:trial_num
    %         if ERD_sort(i)==ERD_ave(j,2)
    %             Good_trial(i)=ERD_ave(j,1);
    %             break;
    %         end
    %     end
    % end
    % Good_trial=sort(Good_trial);
    
    %個別のトライアル表示
    disp2 = figure(j);
    for i=1:trial_num
        subplot(4,5,i)
        f = 0:1:900-1;
        clims = [-100,100];
        imagesc(0:18,f,ERD(:,:,i),clims)
        c=jet;
        c=flipud(c);
        colormap(c);
        c=colorbar;
        c.Label.String='ERD/ERS(%)';
        xlabel('Time [s]','FontName','Helvetica');
        ylabel('Frequency [Hz]','FontName','Helvetica');
        ylim([0 50]);
        set(gca,'ydir','normal','FontName','Helvetica');
        %     line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
        %     line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');
    end
    set(disp2,'position',[0 0 1920 1080]);
    clear -regexp ^hirose



% ERD_average = mean(ERD_all,4);
% ERD_average = mean(ERD(:,:,Good_trial),3); %パーセンテージまでやってからトライアル加算平均
% % ERD_amount = zeros(1000,171,20);
% ERD_amount(:,:,11:20) = ERD(:,:,Good_trial);
% % ERD_amount_m = mean(ERD_amount(:,:,[1:15,17:20]),3);

% t = window_start/EEGSamplingRate+1;
% f = 0:1:900-1;
% figure
% clims = [-100,100];
% imagesc(0:18,f,squeeze(ERD_average),clims)
% c=jet;
% c=flipud(c);
% colormap(c);
% c=colorbar;
% c.Label.String='ERD/ERS(%)';
% xlabel('Time [s]','FontSize',14,'FontName','Helvetica');
% ylabel('Frequency [Hz]','FontSize',14,'FontName','Helvetica');
% ylim([0 50]);
% set(gca,'ydir','normal')
% set(gca,'FontSize',14,'FontName','Helvetica')
% line([9 9],[0 200],'color','r','LineWidth',2,'Linestyle','-');


denoise_trial = find(alltrial);
ERD_denoise = ERD(:,:,denoise_trial);
save([data_mat,'_denoise'],'ERD_denoise','denoise_trial');
end
