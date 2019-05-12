clear all

dir = ('K:\実験データ\kiriyama0620_CAR'); %フォルダ識別
data_mat = 'CAR2';
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);

% dir = ('J:\実験データ\本実験\suwa\suwa(ERD推移等)'); %フォルダ識別
% data_mat = 'suwa_4';
% load([dir,'\',data_mat]); %データ読み取り

% figure
% plot(RefData(:,10))
% xlim([1 30])

trial_num = 20; %トライアル回
Fs=1000;

EEG = double(data); %要素をdouble型に変更
% Lap = (EEG(7,:)+EEG(31,:)+EEG(55,:)+EEG(80,:)+EEG(106,:))/5;
% C3raw = EEG(129,:)'-Lap'; %CAR
C3raw = EEG(129,:); %CAR
C3 = C3raw(1:cell2mat(evt_255_DINs(2,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*3); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで

Band                   =   [3 100];
Wn                     =   Band/(EEGSamplingRate/2); %passband
[B2,A2]                =   butter(3, Wn); %バンドパスフィルタ

stopBand               =   [49 51];
stopWn                 =   stopBand/(EEGSamplingRate/2);
[stopB,stopA]          =   butter(3,stopWn,'stop'); %ノッチフィルタ

task_start = cell2mat(evt_255_DINs(2,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する

for i = 1:trial_num
    C3_segment(:,i) = C3(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
end

H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %窓関数
window_length = EEGSamplingRate; %1秒窓
overlap_rate = 0.9; %90%オーバーラップ
window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %各windowの開始点


for i = 1:length(window_start)
    C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2/(Fs*1000); %[f window_num trial]
end

for k=1:20
C3_power_trial=C3_power(:,:,8);
% RestPower=zeros(31,1);
% window_num=1+(4-1)/(1-0.9);
range=0:1:Fs/2;
% DataB=zeros(31,1000);
% for i=1:window_num
%     m=(i-1)*100;
%     fftData=fft(abs(C3power(1001+m:2000+m,1))' .* hanning(Fs));
%     DataB(i,:)=abs(fftData').^2/(Fs*Fs);
%     RestPower(i)=sqrt(mean(DataB(i,9:14)));
% end
meanDataR=mean(C3_power_trial(:,1:81),2);
% 
% ImagePower=zeros(80,1);
% window_num=1+(5-1)/(1-0.9);
% range=0:1:Fs/2;
% DataC=zeros(51,1000);
% for i=1:window_num
%     m=(i-1)*100;
%     fftData=fft(abs(DataM(1,6001+m:7000+m))' .* hanning(Fs));
%     DataC(i,:)=abs(fftData').^2/(Fs*Fs);
%     ImagePower(i)=DataC(i,10);
% end

for i=1:20
figure
plot(range',meanDataR(1:length(range)),'Linewidth',2);
hold on
plot(range',C3_power_trial(1:length(range),60+i),'Linewidth',2);
% fp2=max(meanDataB);
xlim([0 30])
xlabel('Frequency [Hz]');
ylabel('PSD [μV^2]');
legend('Rest','Image');
legend('boxoff');
line([9 9],ylim,'color','r','LineWidth',1,'Linestyle','-');
line([14 14],ylim,'color','r','LineWidth',1,'Linestyle','-');
end