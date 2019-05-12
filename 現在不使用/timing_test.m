clear all
close all

dir = ('F:\�����f�[�^\�{����\subA\subA(ERD���ړ�)'); %�t�H���_����
data_mat = 'subA_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subB\subB(ERD���ړ�)'); %�t�H���_����
data_mat = 'subB_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subC\subC(ERD���ړ�)'); %�t�H���_����
data_mat = 'subC_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subD\subD(ERD���ړ�)'); %�t�H���_����
data_mat = 'subD_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subE\subE(ERD���ړ�)'); %�t�H���_����
data_mat = 'subE_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subF\subF(ERD���ړ�)'); %�t�H���_����
data_mat = 'subF_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subG\subG(ERD���ړ�)'); %�t�H���_����
data_mat = 'subG_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subH\subH(ERD���ړ�)'); %�t�H���_����
data_mat = 'subH_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subI\subI(ERD���ړ�)'); %�t�H���_����
data_mat = 'subI_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subJ\subJ(ERD���ړ�)'); %�t�H���_����
data_mat = 'subJ_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subK\subK(ERD���ړ�)'); %�t�H���_����
data_mat = 'subK_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subL\subL(ERD���ړ�)'); %�t�H���_����
data_mat = 'subL_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subM\subM(ERD���ړ�)'); %�t�H���_����
data_mat = 'subM_Timing';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

t1=[median(subA_t1),median(subB_t1),median(subC_t1),median(subD_t1),median(subE_t1),median(subF_t1),median(subG_t1),median(subH_t1),median(subI_t1),median(subJ_t1),median(subK_t1),median(subL_t1),median(subM_t1)];
t10=[median(subA_t10),median(subB_t10),median(subC_t10),median(subD_t10),median(subE_t10),median(subF_t10),median(subG_t10),median(subH_t10),median(subI_t10),median(subJ_t10),median(subK_t10),median(subL_t10),median(subM_t10)];

figure
plot(1,t1*100,'o')
hold on
plot(2,t10*100,'o')
for i=1:13
plot([1,2],[t1(i)*100,t10(i)*100],'-o')
end
xlim([0 3])
ylim([1000 3000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'session1','session10'}));
set(gca,'FontSize',14)
ylabel('Time [ms]')
title('�e�팱�҂̎����J�n���E�I�����̃W�����v臒l�̓��B����')

[p,h]=signrank(t1*100,t10*100);


