clear all
close all

dir = ('F:\�����f�[�^\�{����\subA\subA(ERD���ړ�)'); %�t�H���_����
data_mat = 'subA_areaPlus';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

% subA_Area_h1=Area_h1;
% subA_Area_h2=Area_h2;
% subA_Area_n1=Area_n1;
% subA_Area_n2=Area_n2;
% subA_Area_z1=Area_z1;
% subA_Area_z2=Area_z2;
% 
% save('subA_area_median','subA_Area_n1','subA_Area_n2','subA_Area_h1','subA_Area_h2','subA_Area_z1','subA_Area_z2')
% 
% dir = ('F:\�����f�[�^\�{����\subA\subA(ERD���ړ�)'); %�t�H���_����
% data_mat = 'subA_area3';
% load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

subA_AreaPlus_h1=Area_h1;
subA_AreaPlus_h2=Area_h2;
subA_AreaPlus_n1=Area_n1;
subA_AreaPlus_n2=Area_n2;
subA_AreaPlus_z1=Area_z1;
subA_AreaPlus_z2=Area_z2;

save('subA_areaPlus_median','subA_AreaPlus_n1','subA_AreaPlus_n2','subA_AreaPlus_h1','subA_AreaPlus_h2','subA_AreaPlus_z1','subA_AreaPlus_z2')