clear all
close all

ERD_all=zeros(10,1000,171);
for j=1:10
    dir = ('G:\脳波データ(矢上)\2018年12月'); %フォルダ識別
    data_mat = ['hara',num2str(j)];
    load([dir,'\',data_mat]); %データ読み取り
    temp = whos('*mff');
    eval(['data = ',temp(1).name,';']);
    
    trial_num = 20; %トライアル回
    
    EEG = double(data); %要素をdouble型に変更
    % Lap = (EEG(13,:)+EEG(34,:)+EEG(46,:)+EEG(53,:))/4;
    % C3raw = EEG(36,:)'-Lap'; %LLap
    % C3raw = EEG(36,:);
    C3raw=EEG(36,:)-mean(EEG([33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122],:),1);
    C3 = C3raw(1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*1); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで
    
    Band                   =   [3 70];
    Wn                     =   Band/(EEGSamplingRate/2); %passband
    [B2,A2]                =   butter(3, Wn); %バンドパスフィルタ
    
    stopBand               =   [49 51];
    stopWn                 =   stopBand/(EEGSamplingRate/2);
    [stopB,stopA]          =   butter(3,stopWn,'stop'); %ノッチフィルタ
    
    C3filt = filtfilt(stopB,stopA,C3);
    C3filt = filtfilt(B2,A2,C3filt); %detrend必要なしか
    
    task_start = cell2mat(evt_255_DINs(4,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する
    
    for i = 1:trial_num
        C3_segment(:,i) = C3filt(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
    end
    
    H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %窓関数
    window_length = EEGSamplingRate; %1秒窓
    overlap_rate = 0.9; %90%オーバーラップ
    window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %各windowの開始点
    
    
    for i = 1:length(window_start)
        C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2; %[f window_num trial]
    end
    
    ref = repmat(mean(C3_power(:,1:81,:),2),[1,size(C3_power,2),1]); %Referenceの窓平均
    ERD = ((ref-C3_power)./ref)*100; %ERDのパーセンテージ表示
    ERD_average = mean(ERD,3);
    ERD_all(j,:,:) = ERD_average;
    clear -regexp ^hara
end

% ERD_ave=zeros(20,2);
% for i=1:trial_num
%     ERD_ave(i,1)=i;
%     ERD_freq=squeeze(mean(ERD(12:20,:,i),1));
%     ERD_ave(i,2)=mean(ERD_freq(81:171));
% end
%
% ERD_sort=sort(ERD_ave(:,2),'descend');
% ERD_sort=ERD_sort(1:10);
% Good_trial=zeros(10,1);
% for i=1:10
%     for j=1:trial_num
%         if ERD_sort(i)==ERD_ave(j,2)
%             Good_trial(i)=ERD_ave(j,1);
%             break;
%         end
%     end
% end
% Good_trial=sort(Good_trial);

%個別のトライアル表示
% figure
% for i=1:trial_num
%     subplot(4,5,i)
%     f = 0:1:1000-1;
%     clims = [-100,100];
%     imagesc(0:18,f,ERD(:,:,i),clims)
%     c=jet;
%     c=flipud(c);
%     colormap(c);
%     c=colorbar;
%     c.Label.String='ERD/ERS(%)';
%     xlabel('Time [s]','FontName','Helvetica');
%     ylabel('Frequency [Hz]','FontName','Helvetica');
%     ylim([0 50]);
%     set(gca,'ydir','normal','FontName','Helvetica')
%     line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
% %     line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');
% end

% ERD_average = mean(ERD_all,4);
% ERD_average = mean(ERD(:,:,Good_trial),3); %パーセンテージまでやってからトライアル加算平均
% % ERD_amount = zeros(1000,171,20);
% ERD_amount(:,:,11:20) = ERD(:,:,Good_trial);
% % ERD_amount_m = mean(ERD_amount(:,:,[1:15,17:20]),3);

% t = window_start/EEGSamplingRate+1;
f = 0:1:1000-1;
figure
for j=1:10
    subplot(2,5,j);
    clims = [-100,100];
    imagesc(0:18,f,squeeze(ERD_all(j,:,:)),clims)
    c=jet;
    c=flipud(c);
    colormap(c);
    c=colorbar;
    c.Label.String='ERD/ERS(%)';
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    ylim([0 50]);
    set(gca,'ydir','normal')
    set(gca,'FontSize',10,'FontName','Helvetica')
    line([9 9],[0 200],'color','r','LineWidth',2,'Linestyle','-');
end

ERD_foi_ave = squeeze(mean(ERD_all(:,8:12,:),2));
figure
boxplot(ERD_foi_ave(:,91:171)');



% Good_trial'
