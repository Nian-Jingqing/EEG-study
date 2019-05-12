clear all
close all

dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_areaPlus';
load([dir,'\',data_mat]); %データ読み取り

% subA_Area_h1=Area_h1;
% subA_Area_h2=Area_h2;
% subA_Area_n1=Area_n1;
% subA_Area_n2=Area_n2;
% subA_Area_z1=Area_z1;
% subA_Area_z2=Area_z2;
% 
% save('subA_area_median','subA_Area_n1','subA_Area_n2','subA_Area_h1','subA_Area_h2','subA_Area_z1','subA_Area_z2')
% 
% dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
% data_mat = 'subA_area3';
% load([dir,'\',data_mat]); %データ読み取り

subA_AreaPlus_h1=Area_h1;
subA_AreaPlus_h2=Area_h2;
subA_AreaPlus_n1=Area_n1;
subA_AreaPlus_n2=Area_n2;
subA_AreaPlus_z1=Area_z1;
subA_AreaPlus_z2=Area_z2;

save('subA_areaPlus_median','subA_AreaPlus_n1','subA_AreaPlus_n2','subA_AreaPlus_h1','subA_AreaPlus_h2','subA_AreaPlus_z1','subA_AreaPlus_z2')