clear all

dir = ('F:\�����f�[�^\�{����\subM\subM(ERD���ړ�)'); %�t�H���_����
data_mat = 'subM_cal';
load([dir,'\',data_mat]);  %�t�H���_����

ahalf=23;
bhalf=12;
chalf=13;

save('subM_cal','RefData','ERDData','ERDMax','ERDGoal','JumpTh','JumpERD','ahalf','bhalf','chalf');
