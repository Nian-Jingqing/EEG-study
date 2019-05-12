clear all; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% get EEG data+Segmentation+Filter%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dir = ('G:\脳波データ(矢上)\2018年11月'); %フォルダ識別
data_mat = 'yoshida7';
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
data=double(data);
Fs=1000;

%α帯%
Freq_max               =   9;
Freq_min               =   13;
%バンドパスフィルタ%
Band                   =   [8 13];
Wn                     =   Band/(Fs/2); %passband
[B,A]                  =   butter(3, Wn);
%バンドパスフィルタ2%
Band                   =   [3 100];
Wn                     =   Band/(Fs/2); %passband
[B2,A2]                =   butter(3, Wn);
%ノッチフィルタ%
stopBand               =   [49 51];
stopWn                 =   stopBand/(Fs/2);
[stopB,stopA]          =   butter(3,stopWn,'stop');

trial_num=20;
datacut = data(:,1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*1);

filtdata=filter(stopB,stopA,datacut,[],2);
filtdata=filter(B2,A2,filtdata,[],2);

task_start = cell2mat(evt_255_DINs(4,strmatch('DIN3',evt_255_DINs(1,:))));
for i = 1:trial_num
    dataY(:,:,i) = filtdata(:,task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
end

for j=1:128
figure
for i=1:trial_num
    subplot(4,5,i)
    plot(1:size(dataY,2),dataY(j,:,i));
    line([6000 6000],[-5 5],'color','r');
    line([15000 15000],[-5 5],'color','b')
    ylim([-5 5])
end
title(j)
end

% save([data_mat,'_seg'],'dataY');

