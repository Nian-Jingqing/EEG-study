clear all
close all

dir = ('K:\�����f�[�^\kiriyama0624'); %�t�H���_����
data_mat = 'iwama3';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);

trial_num = 20; %�g���C�A����

EEG = double(data); %�v�f��double�^�ɕύX
Lap = (EEG(13,:)+EEG(34,:)+EEG(46,:)+EEG(53,:))/4;
C3raw = EEG(36,:)'-Lap';
C3 = C3raw(1:cell2mat(evt_255_DINs(2,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*3); %strmatch����v���镶���񌟏o �^��J�n����Ō��DIN5�܂�

Band                   =   [8 12];
Wn                     =   Band/(EEGSamplingRate/2); %passband
[B2,A2]                =   butter(3, Wn); %�o���h�p�X�t�B���^

stopBand               =   [49 51];
stopWn                 =   stopBand/(EEGSamplingRate/2);
[stopB,stopA]          =   butter(3,stopWn,'stop'); %�m�b�`�t�B���^

C3filt = filtfilt(stopB,stopA,C3);
C3filt = filtfilt(B2,A2,C3filt);

task_start = cell2mat(evt_255_DINs(2,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3�̈ʒu���������o����

for i = 1:trial_num
    C3_segment(:,i) = C3filt(task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3���Rest�J�n����Rest2�I���܂ŃZ�O�����g
end

H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %���֐�
window_length = EEGSamplingRate; %1�b��
overlap_rate = 0.9; %90%�I�[�o�[���b�v
window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %�ewindow�̊J�n�_


% for i = 1:length(window_start)
%     C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2/(Fs*1000); %[f window_num trial]
% end
figure
plot(C3_segment(:,11));
    xlabel('Time [ms]','fontsize',20);
    ylabel('Amplitude [��V]','fontsize',20);
    set(gca,'FontSize',10)
    xlim([0 18000])
    ylim([-10 10])
    line([9000 9000],ylim,'color','r','LineWidth',1,'Linestyle','-');
% for i=1:trial_num
%     fData=C3_segment(:,i);
%     subplot(4,5,i)
%     plot(fData);
%     xlabel('Time [ms]','fontsize',20);
%     ylabel('Amplitude [��V]','fontsize',20);
%     set(gca,'FontSize',10)
%     xlim([0 18000])
%     ylim([-50 50])
%     line([9000 9000],ylim,'color','r','LineWidth',1,'Linestyle','-');
% end

% C3filt=detrend(C3,'linear');
% C3filt = filter(stopB,stopA,C3);
% C3filt = filter(B2,A2,C3filt); %detrend�K�v�Ȃ���

