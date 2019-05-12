clear all
close all

dir = ('K:\実験データ\kiriyama0624'); %フォルダ識別
data_mat = 'iwama3';
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);

trial_num = 20; %トライアル回数

EEG = double(data); %要素をdouble型に変更
Lap = (EEG(13,:)+EEG(34,:)+EEG(46,:)+EEG(53,:))/4;
C3raw = EEG(36,:)'-Lap';
C3 = C3raw(1:cell2mat(evt_255_DINs(2,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*3); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで

Band                   =   [8 12];
Wn                     =   Band/(EEGSamplingRate/2); %passband
[B2,A2]                =   butter(3, Wn); %バンドパスフィルタ

stopBand               =   [49 51];
stopWn                 =   stopBand/(EEGSamplingRate/2);
[stopB,stopA]          =   butter(3,stopWn,'stop'); %ノッチフィルタ

C3filt = filtfilt(stopB,stopA,C3);
C3filt = filtfilt(B2,A2,C3filt);

task_start = cell2mat(evt_255_DINs(2,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する

for i = 1:trial_num
    C3_segment(:,i) = C3filt(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
end

H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %窓関数
window_length = EEGSamplingRate; %1秒窓
overlap_rate = 0.9; %90%オーバーラップ
window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %各windowの開始点


% for i = 1:length(window_start)
%     C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2/(Fs*1000); %[f window_num trial]
% end
figure
plot(C3_segment(:,11));
    xlabel('Time [ms]','fontsize',20);
    ylabel('Amplitude [μV]','fontsize',20);
    set(gca,'FontSize',10)
    xlim([0 18000])
    ylim([-10 10])
    line([9000 9000],ylim,'color','r','LineWidth',1,'Linestyle','-');
% for i=1:trial_num
%     fData=C3_segment(:,i);
%     subplot(4,5,i)
%     plot(fData);
%     xlabel('Time [ms]','fontsize',20);
%     ylabel('Amplitude [μV]','fontsize',20);
%     set(gca,'FontSize',10)
%     xlim([0 18000])
%     ylim([-50 50])
%     line([9000 9000],ylim,'color','r','LineWidth',1,'Linestyle','-');
% end

% C3filt=detrend(C3,'linear');
% C3filt = filter(stopB,stopA,C3);
% C3filt = filter(B2,A2,C3filt); %detrend必要なしか

