clear all
close all

dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_Timing';
load([dir,'\',data_mat]); %データ読み取り


%%
figure
plot(1,t1,'o')
hold on
plot(2,t10,'o')
plot([1,2],[median(t1),median(t10)],'k-o')
xlim([0 3])
%%
% Area_hall=[Area_h1 Area_h2];
% Area_zall=[Area_z1 Area_z2];
% [p,h]=ranksum(Area_h1,Area_z1);
% [p2,h2]=ranksum(Area_h2,Area_z2);
% [p3,h3]=ranksum(Area_h1,Area_h2);
% [p4,h4]=ranksum(Area_z1,Area_z2);
% [p5,h5]=ranksum(Area_hall,Area_zall);

[p,h]=ranksum(t1,t10);







