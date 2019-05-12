clear all

dir = ('F:\実験データ\本実験\okamoto'); %フォルダ識別
data_mat = 'okamoto_1';
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);

trial_num = 20; %トライアル回数

EEG = double(data); %要素をdouble型に変更
% Lap = (EEG(29,:)+EEG(30,:)+EEG(35,:)+EEG(37,:)+EEG(41,:)+EEG(42,:))/6;
C3raw = EEG(36,:)'; %CAR
C3 = C3raw(1:cell2mat(evt_255_DINs(2,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*3,1); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで

Band                   =   [3 70];
Wn                     =   Band/(EEGSamplingRate/2); %passband
[B2,A2]                =   butter(2, Wn); %バンドパスフィルタ

stopBand               =   [49 51];
stopWn                 =   stopBand/(EEGSamplingRate/2);
[stopB,stopA]          =   butter(3,stopWn,'stop'); %ノッチフィルタ

C3filt = filtfilt(stopB,stopA,C3);
C3filt = filtfilt(B2,A2,C3filt); %detrend必要なしか

task_start = cell2mat(evt_255_DINs(2,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する

for i = 1:trial_num
    C3_segment(:,i) = C3filt(task_start(1,i)-EEGSamplingRate*6:task_start(1,i)+EEGSamplingRate*5-1); %DIN3基準でRest開始からRest2終了までセグメント
end

H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %窓関数
window_length = EEGSamplingRate; %1秒窓
overlap_rate = 0.9; %90%オーバーラップ
window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %各windowの開始点

for i = 1:length(window_start)
    C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2; %[f window_num trial]
end

dir = ('F:\実験データ\本実験\okamoto\okamoto(ERD推移等)'); %フォルダ識別
data_mat = 'okamoto_1';
load([dir,'\',data_mat]); %データ読み取り

ERD_foi=zeros(20,50);
for i=1:trial_num
    C3_power_i=C3_power(:,:,i);
    ref = repmat(RefData(:,i),[1,size(C3_power_i,2),1]);
    ERD = ((C3_power_i-ref)./ref)*100; %ERDのパーセンテージ表示
    ERD_alpha = mean(ERD(9:14,:),1);
    ERD_foi(i,:)=ERD_alpha(52:101);
end


