clear all
% close all

for j=3
dir = ('G:\脳波データ(済生会AF除去)'); %フォルダ識別
data_mat = ['nagai',num2str(j)];
load([dir,'\',data_mat]); %データ読み取り

n           = 3;
Band        = [3,95];
notch       = 50;
fs = 200;
% dataECG = double(dataECG);
[BandB,BandA]   = butter(n,Band/(fs/2),'bandpass');
[NotchB,NotchA] = butter(n,[notch-1,notch+1]/(fs/2),'stop');

% dataECG = filtfilt(BandB,BandA,filtfilt(NotchB,NotchA,dataECG));

figure(j)
plot(1:600,BufferAR(5401:6000));
% line([0 size(dataECG,2)],[3000 3000],'LineWidth',0.5,'color','r')
% line([0 size(dataECG,2)],[4000 4000],'LineWidth',0.5,'color','g')
clear -regexp ^nagai
end