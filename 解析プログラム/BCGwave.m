clear all
close all

for j=1:9
dir = ('G:\脳波データ(矢上)\2019年2月'); %フォルダ識別
data_mat = ['yamazaki',num2str(j)];
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
% tempECG = whos('*mffECG');
% eval(['dataECG = ',tempECG(1).name,';']);

n           = 3;
Band        = [8,13];
notch       = 50;
fs = 200;
EEG = double(data);
C3raw=EEG(36,:)-mean(EEG([129 7 106 31 55 80 6 112 105 87 79 54 37 30 13 12 5 118 111 104 93,...
                          86 78 62 61 53 42 36 29 20 11 4 124 117 110 103 98 92 85 77 72 67,...
                          60 52 47 41 35 28 24 19 3 123 116 109 102 97 91 84 76 71 66 59 51,...
                          46 40 34 27 23 65 64 90 95 70 75 83 69 74 82 89],:),1);
C3 = C3raw(1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*1);
[BandB,BandA]   = butter(n,Band/(EEGSamplingRate/2),'bandpass');
[NotchB,NotchA] = butter(n,[notch-1,notch+1]/(EEGSamplingRate/2),'stop');

% data=data(:,cell2mat(evt_255_DINs(4,strmatch('DIN1',evt_255_DINs(1,:)))):end)';
C3 = filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,C3));
% dataECG=dataECG(:,cell2mat(evt_255_DINs(4,strmatch('DIN1',evt_255_DINs(1,:)))):end)';
% dataECG = filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,dataECG));

figure(j)
plot(1:size(C3,2),C3)
% line([0 size(dataECG,2)],[3000 3000],'LineWidth',0.5,'color','r')
% line([0 size(dataECG,2)],[4000 4000],'LineWidth',0.5,'color','g')
clear -regexp ^yamazaki
end