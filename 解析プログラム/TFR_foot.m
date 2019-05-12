clear all
close all

dir = ('K:\実験データ\kiriyama0620_CAR'); %フォルダ識別
data_mat = 'CAR7';
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);

trial_num = 20; %トライアル回

EEG = double(data); %要素をdouble型に変更
% Lap = (EEG(6,:)+EEG(30,:)+EEG(54,:)+EEG(79,:)+EEG(105,:))/5;
% C3raw = EEG(129,:)'-Lap'; %CAR
C3raw = EEG(129,:); %CAR
C3 = C3raw(1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*3); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで

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

figure
for i=1:trial_num
    subplot(4,5,i)
    f = 0:1:1000-1;
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
    set(gca,'ydir','normal','FontName','Helvetica')
%     line([1 1],[0 200],'color','b','LineWidth',3,'Linestyle','-');
%     line([8 8],[0 200],'color','b','LineWidth',3,'Linestyle','-');
    line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
%     line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');
end

ERD_average = mean(ERD,3); %パーセンテージまでやってからトライアル加算平均

% t = window_start/EEGSamplingRate+1;
f = 0:1:1000-1;
figure
clims = [-100,100];
imagesc(0:18,f,ERD_average,clims)
c=jet;
c=flipud(c);
colormap(c);
c=colorbar;
c.Label.String='ERD/ERS(%)';
xlabel('Time [s]','FontSize',14,'FontName','Helvetica');
ylabel('Frequency [Hz]','FontSize',14,'FontName','Helvetica');
ylim([0 50]);
set(gca,'ydir','normal')
set(gca,'FontSize',14,'FontName','Helvetica')
% line([2 2],[0 200],'color','b','LineWidth',3,'Linestyle','-');
% line([8 8],[0 200],'color','b','LineWidth',3,'Linestyle','-');
line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
