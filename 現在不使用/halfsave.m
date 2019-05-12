clear all

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_cal';
load([dir,'\',data_mat]);  %フォルダ識別

ahalf=23;
bhalf=12;
chalf=13;

save('subM_cal','RefData','ERDData','ERDMax','ERDGoal','JumpTh','JumpERD','ahalf','bhalf','chalf');
