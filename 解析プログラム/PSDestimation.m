clear all

dir = ('K:\�����f�[�^\kiriyama0620_CAR'); %�t�H���_����
data_mat = 'CAR2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);

% dir = ('J:\�����f�[�^\�{����\suwa\suwa(ERD���ړ�)'); %�t�H���_����
% data_mat = 'suwa_4';
% load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

% figure
% plot(RefData(:,10))
% xlim([1 30])

trial_num = 20; %�g���C�A����
Fs=1000;

EEG = double(data); %�v�f��double�^�ɕύX
% Lap = (EEG(7,:)+EEG(31,:)+EEG(55,:)+EEG(80,:)+EEG(106,:))/5;
% C3raw = EEG(129,:)'-Lap'; %CAR
C3raw = EEG(129,:); %CAR
C3 = C3raw(1:cell2mat(evt_255_DINs(2,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*3); %strmatch����v���镶���񌟏o �^��J�n����Ō��DIN5�܂�

Band                   =   [3 100];
Wn                     =   Band/(EEGSamplingRate/2); %passband
[B2,A2]                =   butter(3, Wn); %�o���h�p�X�t�B���^

stopBand               =   [49 51];
stopWn                 =   stopBand/(EEGSamplingRate/2);
[stopB,stopA]          =   butter(3,stopWn,'stop'); %�m�b�`�t�B���^

task_start = cell2mat(evt_255_DINs(2,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3�̈ʒu���������o����

for i = 1:trial_num
    C3_segment(:,i) = C3(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3���Rest�J�n����Rest2�I���܂ŃZ�O�����g
end

H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %���֐�
window_length = EEGSamplingRate; %1�b��
overlap_rate = 0.9; %90%�I�[�o�[���b�v
window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %�ewindow�̊J�n�_


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
ylabel('PSD [��V^2]');
legend('Rest','Image');
legend('boxoff');
line([9 9],ylim,'color','r','LineWidth',1,'Linestyle','-');
line([14 14],ylim,'color','r','LineWidth',1,'Linestyle','-');
end