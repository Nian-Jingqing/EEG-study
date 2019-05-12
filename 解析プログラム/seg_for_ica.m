clear all; 
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% get EEG data+Segmentation+Filter%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dir = ('G:\�]�g�f�[�^(���)\2018�N11��'); %�t�H���_����
data_mat = 'tobe10';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
data=double(data);
data=data-repmat(mean(data,1),129,1); %CAR
Fs=1000;
%����%
Freq_max               =   9;
Freq_min               =   13;
%�o���h�p�X�t�B���^%
Band                   =   [8 13];
Wn                     =   Band/(Fs/2); %passband
[B,A]                  =   butter(3, Wn);
%�o���h�p�X�t�B���^2%
Band                   =   [3 100];
Wn                     =   Band/(Fs/2); %passband
[B2,A2]                =   butter(3, Wn);
%�m�b�`�t�B���^%
stopBand               =   [49 51];
stopWn                 =   stopBand/(Fs/2);
[stopB,stopA]          =   butter(3,stopWn,'stop');

trial_num=20;

datacut = data(:,1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*1); %strmatch����v���镶���񌟏o �^��J�n����Ō��DIN5�܂�

filtdata=filter(stopB,stopA,datacut,[],2);
filtdata=filter(B2,A2,filtdata,[],2);

task_start = cell2mat(evt_255_DINs(4,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3�̈ʒu���������o����

for i = 1:trial_num
    dataY(:,:,i) = filtdata(:,task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3���Rest�J�n����Rest2�I���܂ŃZ�O�����g
end

save([data_mat,'_seg'],'dataY');