trial_num = 20; %�g���C�A����

Band                   =   [3 100];
Wn                     =   Band/(EEGSamplingRate/2); %passband
[B2,A2]                =   butter(2, Wn); %�o���h�p�X�t�B���^

stopBand               =   [49 51];
stopWn                 =   stopBand/(EEGSamplingRate/2);
[stopB,stopA]          =   butter(3,stopWn,'stop'); %�m�b�`�t�B���^

for i = 1:trial_num
    DataBuffer(:,i) = filter(stopB,stopA,DataBuffer(:,i));
    DataBuffer(:,i) = filter(B2,A2,DataBuffer(:,i));
end

H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %���֐�
window_length = EEGSamplingRate; %1�b��
overlap_rate = 0.9; %90%�I�[�o�[���b�v
window_start = round(1:window_length*(1-0.9):length(DataBuffer)-window_length+1); %�ewindow�̊J�n�_


for i = 1:length(window_start)
    C3_power(:,i,:) = abs(fft(DataBuffer(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2; %[f window_num trial]
end

ref = repmat(mean(C3_power(:,11:41,:),2),[1,size(C3_power,2),1]); %Reference�̑�����
ERD = ((C3_power-ref)./ref)*100; %ERD�̃p�[�Z���e�[�W�\��
ERD_average = mean(ERD,3); %�p�[�Z���e�[�W�܂ł���Ă���g���C�A�����Z����

% t = window_start/EEGSamplingRate+1;
f = 0:1:1000-1;
figure
clims = [-100,100];
imagesc(0:11,f,ERD_average,clims)
colormap jet
c=colorbar;
c.Label.String='ERP(%)';
xlabel('Time [s]');
ylabel('Frequency [Hz]');
ylim([0 50]);
set(gca,'ydir','normal')
line([1 1],[0 200],'color','b','LineWidth',3,'Linestyle','-');
line([5 5],[0 200],'color','b','LineWidth',3,'Linestyle','-');
line([6 6],[0 200],'color','r','LineWidth',3,'Linestyle','-');
line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');
