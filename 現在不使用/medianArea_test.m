clear all
close all

dir = ('K:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subB\subB(ERD推移等)'); %フォルダ識別
data_mat = 'subB_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subC\subC(ERD推移等)'); %フォルダ識別
data_mat = 'subC_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subD\subD(ERD推移等)'); %フォルダ識別
data_mat = 'subD_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subE\subE(ERD推移等)'); %フォルダ識別
data_mat = 'subE_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subF\subF(ERD推移等)'); %フォルダ識別
data_mat = 'subF_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subG\subG(ERD推移等)'); %フォルダ識別
data_mat = 'subG_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subH\subH(ERD推移等)'); %フォルダ識別
data_mat = 'subH_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subI\subI(ERD推移等)'); %フォルダ識別
data_mat = 'subI_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subJ\subJ(ERD推移等)'); %フォルダ識別
data_mat = 'subJ_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subK\subK(ERD推移等)'); %フォルダ識別
data_mat = 'subK_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subL\subL(ERD推移等)'); %フォルダ識別
data_mat = 'subL_area_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('K:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_area_median';
load([dir,'\',data_mat]); %データ読み取り



subA_Area_h1=subA_Area_h1(find(subA_Area_h1));
subA_Area_z1=subA_Area_z1(find(subA_Area_z1));
subA_Area_h2=subA_Area_h2(find(subA_Area_h2));
subA_Area_z2=subA_Area_z2(find(subA_Area_z2));
subB_Area_h1=subB_Area_h1(find(subB_Area_h1));
subB_Area_z1=subB_Area_z1(find(subB_Area_z1));
subB_Area_h2=subB_Area_h2(find(subB_Area_h2));
subB_Area_z2=subB_Area_z2(find(subB_Area_z2));
subC_Area_h1=subC_Area_h1(find(subC_Area_h1));
subC_Area_z1=subC_Area_z1(find(subC_Area_z1));
subC_Area_h2=subC_Area_h2(find(subC_Area_h2));
subC_Area_z2=subC_Area_z2(find(subC_Area_z2));
subD_Area_h1=subD_Area_h1(find(subD_Area_h1));
subD_Area_z1=subD_Area_z1(find(subD_Area_z1));
subD_Area_h2=subD_Area_h2(find(subD_Area_h2));
subD_Area_z2=subD_Area_z2(find(subD_Area_z2));
subE_Area_h1=subE_Area_h1(find(subE_Area_h1));
subE_Area_z1=subE_Area_z1(find(subE_Area_z1));
subE_Area_h2=subE_Area_h2(find(subE_Area_h2));
subE_Area_z2=subE_Area_z2(find(subE_Area_z2));
subF_Area_h1=subF_Area_h1(find(subF_Area_h1));
subF_Area_z1=subF_Area_z1(find(subF_Area_z1));
subF_Area_h2=subF_Area_h2(find(subF_Area_h2));
subF_Area_z2=subF_Area_z2(find(subF_Area_z2));
subG_Area_h1=subG_Area_h1(find(subG_Area_h1));
subG_Area_z1=subG_Area_z1(find(subG_Area_z1));
subG_Area_h2=subG_Area_h2(find(subG_Area_h2));
subG_Area_z2=subG_Area_z2(find(subG_Area_z2));
subH_Area_h1=subH_Area_h1(find(subH_Area_h1));
subH_Area_z1=subH_Area_z1(find(subH_Area_z1));
subH_Area_h2=subH_Area_h2(find(subH_Area_h2));
subH_Area_z2=subH_Area_z2(find(subH_Area_z2));
subI_Area_h1=subI_Area_h1(find(subI_Area_h1));
subI_Area_z1=subI_Area_z1(find(subI_Area_z1));
subI_Area_h2=subI_Area_h2(find(subI_Area_h2));
subI_Area_z2=subI_Area_z2(find(subI_Area_z2));
subJ_Area_h1=subJ_Area_h1(find(subJ_Area_h1));
subJ_Area_z1=subJ_Area_z1(find(subJ_Area_z1));
subJ_Area_h2=subJ_Area_h2(find(subJ_Area_h2));
subJ_Area_z2=subJ_Area_z2(find(subJ_Area_z2));
subK_Area_h1=subK_Area_h1(find(subK_Area_h1));
subK_Area_z1=subK_Area_z1(find(subK_Area_z1));
subK_Area_h2=subK_Area_h2(find(subK_Area_h2));
subK_Area_z2=subK_Area_z2(find(subK_Area_z2));
subL_Area_h1=subL_Area_h1(find(subL_Area_h1));
subL_Area_z1=subL_Area_z1(find(subL_Area_z1));
subL_Area_h2=subL_Area_h2(find(subL_Area_h2));
subL_Area_z2=subL_Area_z2(find(subL_Area_z2));
subM_Area_h1=subM_Area_h1(find(subM_Area_h1));
subM_Area_z1=subM_Area_z1(find(subM_Area_z1));
subM_Area_h2=subM_Area_h2(find(subM_Area_h2));
subM_Area_z2=subM_Area_z2(find(subM_Area_z2));
subL_Area_h1=subL_Area_h1(find(subL_Area_h1));
subL_Area_z1=subL_Area_z1(find(subL_Area_z1));
subL_Area_h2=subL_Area_h2(find(subL_Area_h2));
subL_Area_z2=subL_Area_z2(find(subL_Area_z2));

subA_Area_hall=[subA_Area_h1 subA_Area_h2];
subA_Area_zall=[subA_Area_z1 subA_Area_z2];
subB_Area_hall=[subB_Area_h1 subB_Area_h2];
subB_Area_zall=[subB_Area_z1 subB_Area_z2];
subC_Area_hall=[subC_Area_h1 subC_Area_h2];
subC_Area_zall=[subC_Area_z1 subC_Area_z2];
subD_Area_hall=[subD_Area_h1 subD_Area_h2];
subD_Area_zall=[subD_Area_z1 subD_Area_z2];
subE_Area_hall=[subE_Area_h1 subE_Area_h2];
subE_Area_zall=[subE_Area_z1 subE_Area_z2];
subF_Area_hall=[subF_Area_h1 subF_Area_h2];
subF_Area_zall=[subF_Area_z1 subF_Area_z2];
subG_Area_hall=[subG_Area_h1 subG_Area_h2];
subG_Area_zall=[subG_Area_z1 subG_Area_z2];
subH_Area_hall=[subH_Area_h1 subH_Area_h2];
subH_Area_zall=[subH_Area_z1 subH_Area_z2];
subI_Area_hall=[subI_Area_h1 subI_Area_h2];
subI_Area_zall=[subI_Area_z1 subI_Area_z2];
subJ_Area_hall=[subJ_Area_h1 subJ_Area_h2];
subJ_Area_zall=[subJ_Area_z1 subJ_Area_z2];
subK_Area_hall=[subK_Area_h1 subK_Area_h2];
subK_Area_zall=[subK_Area_z1 subK_Area_z2];
subL_Area_hall=[subL_Area_h1 subL_Area_h2];
subL_Area_zall=[subL_Area_z1 subL_Area_z2];
subM_Area_hall=[subM_Area_h1 subM_Area_h2];
subM_Area_zall=[subM_Area_z1 subM_Area_z2];

subA_Area_h1=subA_Area_h1(abs(subA_Area_h1-mean(subA_Area_h1))<2*std(subA_Area_h1));
subA_Area_z1=subA_Area_z1(abs(subA_Area_z1-mean(subA_Area_z1))<2*std(subA_Area_z1));
subA_Area_h2=subA_Area_h2(abs(subA_Area_h2-mean(subA_Area_h2))<2*std(subA_Area_h2));
subA_Area_z2=subA_Area_z2(abs(subA_Area_z2-mean(subA_Area_z2))<2*std(subA_Area_z2));
subA_Area_hall=subA_Area_hall(abs(subA_Area_hall-mean(subA_Area_hall))<2*std(subA_Area_hall));
subA_Area_zall=subA_Area_zall(abs(subA_Area_zall-mean(subA_Area_zall))<2*std(subA_Area_zall));
subB_Area_h1=subB_Area_h1(abs(subB_Area_h1-mean(subB_Area_h1))<2*std(subB_Area_h1));
subB_Area_z1=subB_Area_z1(abs(subB_Area_z1-mean(subB_Area_z1))<2*std(subB_Area_z1));
subB_Area_h2=subB_Area_h2(abs(subB_Area_h2-mean(subB_Area_h2))<2*std(subB_Area_h2));
subB_Area_z2=subB_Area_z2(abs(subB_Area_z2-mean(subB_Area_z2))<2*std(subB_Area_z2));
subB_Area_hall=subB_Area_hall(abs(subB_Area_hall-mean(subB_Area_hall))<2*std(subB_Area_hall));
subB_Area_zall=subB_Area_zall(abs(subB_Area_zall-mean(subB_Area_zall))<2*std(subB_Area_zall));
subC_Area_h1=subC_Area_h1(abs(subC_Area_h1-mean(subC_Area_h1))<2*std(subC_Area_h1));
subC_Area_z1=subC_Area_z1(abs(subC_Area_z1-mean(subC_Area_z1))<2*std(subC_Area_z1));
subC_Area_h2=subC_Area_h2(abs(subC_Area_h2-mean(subC_Area_h2))<2*std(subC_Area_h2));
subC_Area_z2=subC_Area_z2(abs(subC_Area_z2-mean(subC_Area_z2))<2*std(subC_Area_z2));
subC_Area_hall=subC_Area_hall(abs(subC_Area_hall-mean(subC_Area_hall))<2*std(subC_Area_hall));
subC_Area_zall=subC_Area_zall(abs(subC_Area_zall-mean(subC_Area_zall))<2*std(subC_Area_zall));
subD_Area_h1=subD_Area_h1(abs(subD_Area_h1-mean(subD_Area_h1))<2*std(subD_Area_h1));
subD_Area_z1=subD_Area_z1(abs(subD_Area_z1-mean(subD_Area_z1))<2*std(subD_Area_z1));
subD_Area_h2=subD_Area_h2(abs(subD_Area_h2-mean(subD_Area_h2))<2*std(subD_Area_h2));
subD_Area_z2=subD_Area_z2(abs(subD_Area_z2-mean(subD_Area_z2))<2*std(subD_Area_z2));
subD_Area_hall=subD_Area_hall(abs(subD_Area_hall-mean(subD_Area_hall))<2*std(subD_Area_hall));
subD_Area_zall=subD_Area_zall(abs(subD_Area_zall-mean(subD_Area_zall))<2*std(subD_Area_zall));
subE_Area_h1=subE_Area_h1(abs(subE_Area_h1-mean(subE_Area_h1))<2*std(subE_Area_h1));
subE_Area_z1=subE_Area_z1(abs(subE_Area_z1-mean(subE_Area_z1))<2*std(subE_Area_z1));
subE_Area_h2=subE_Area_h2(abs(subE_Area_h2-mean(subE_Area_h2))<2*std(subE_Area_h2));
subE_Area_z2=subE_Area_z2(abs(subE_Area_z2-mean(subE_Area_z2))<2*std(subE_Area_z2));
subE_Area_hall=subE_Area_hall(abs(subE_Area_hall-mean(subE_Area_hall))<2*std(subE_Area_hall));
subE_Area_zall=subE_Area_zall(abs(subE_Area_zall-mean(subE_Area_zall))<2*std(subE_Area_zall));
subF_Area_h1=subF_Area_h1(abs(subF_Area_h1-mean(subF_Area_h1))<2*std(subF_Area_h1));
subF_Area_z1=subF_Area_z1(abs(subF_Area_z1-mean(subF_Area_z1))<2*std(subF_Area_z1));
subF_Area_h2=subF_Area_h2(abs(subF_Area_h2-mean(subF_Area_h2))<2*std(subF_Area_h2));
subF_Area_z2=subF_Area_z2(abs(subF_Area_z2-mean(subF_Area_z2))<2*std(subF_Area_z2));
subF_Area_hall=subF_Area_hall(abs(subF_Area_hall-mean(subF_Area_hall))<2*std(subF_Area_hall));
subF_Area_zall=subF_Area_zall(abs(subF_Area_zall-mean(subF_Area_zall))<2*std(subF_Area_zall));
subG_Area_h1=subG_Area_h1(abs(subG_Area_h1-mean(subG_Area_h1))<2*std(subG_Area_h1));
subG_Area_z1=subG_Area_z1(abs(subG_Area_z1-mean(subG_Area_z1))<2*std(subG_Area_z1));
subG_Area_h2=subG_Area_h2(abs(subG_Area_h2-mean(subG_Area_h2))<2*std(subG_Area_h2));
subG_Area_z2=subG_Area_z2(abs(subG_Area_z2-mean(subG_Area_z2))<2*std(subG_Area_z2));
subG_Area_hall=subG_Area_hall(abs(subG_Area_hall-mean(subG_Area_hall))<2*std(subG_Area_hall));
subG_Area_zall=subG_Area_zall(abs(subG_Area_zall-mean(subG_Area_zall))<2*std(subG_Area_zall));
subH_Area_h1=subH_Area_h1(abs(subH_Area_h1-mean(subH_Area_h1))<2*std(subH_Area_h1));
subH_Area_z1=subH_Area_z1(abs(subH_Area_z1-mean(subH_Area_z1))<2*std(subH_Area_z1));
subH_Area_h2=subH_Area_h2(abs(subH_Area_h2-mean(subH_Area_h2))<2*std(subH_Area_h2));
subH_Area_z2=subH_Area_z2(abs(subH_Area_z2-mean(subH_Area_z2))<2*std(subH_Area_z2));
subH_Area_hall=subH_Area_hall(abs(subH_Area_hall-mean(subH_Area_hall))<2*std(subH_Area_hall));
subH_Area_zall=subH_Area_zall(abs(subH_Area_zall-mean(subH_Area_zall))<2*std(subH_Area_zall));
subI_Area_h1=subI_Area_h1(abs(subI_Area_h1-mean(subI_Area_h1))<2*std(subI_Area_h1));
subI_Area_z1=subI_Area_z1(abs(subI_Area_z1-mean(subI_Area_z1))<2*std(subI_Area_z1));
subI_Area_h2=subI_Area_h2(abs(subI_Area_h2-mean(subI_Area_h2))<2*std(subI_Area_h2));
subI_Area_z2=subI_Area_z2(abs(subI_Area_z2-mean(subI_Area_z2))<2*std(subI_Area_z2));
subI_Area_hall=subI_Area_hall(abs(subI_Area_hall-mean(subI_Area_hall))<2*std(subI_Area_hall));
subI_Area_zall=subI_Area_zall(abs(subI_Area_zall-mean(subI_Area_zall))<2*std(subI_Area_zall));
subJ_Area_h1=subJ_Area_h1(abs(subJ_Area_h1-mean(subJ_Area_h1))<2*std(subJ_Area_h1));
subJ_Area_z1=subJ_Area_z1(abs(subJ_Area_z1-mean(subJ_Area_z1))<2*std(subJ_Area_z1));
subJ_Area_h2=subJ_Area_h2(abs(subJ_Area_h2-mean(subJ_Area_h2))<2*std(subJ_Area_h2));
subJ_Area_z2=subJ_Area_z2(abs(subJ_Area_z2-mean(subJ_Area_z2))<2*std(subJ_Area_z2));
subJ_Area_hall=subJ_Area_hall(abs(subJ_Area_hall-mean(subJ_Area_hall))<2*std(subJ_Area_hall));
subJ_Area_zall=subJ_Area_zall(abs(subJ_Area_zall-mean(subJ_Area_zall))<2*std(subJ_Area_zall));
subK_Area_h1=subK_Area_h1(abs(subK_Area_h1-mean(subK_Area_h1))<2*std(subK_Area_h1));
subK_Area_z1=subK_Area_z1(abs(subK_Area_z1-mean(subK_Area_z1))<2*std(subK_Area_z1));
subK_Area_h2=subK_Area_h2(abs(subK_Area_h2-mean(subK_Area_h2))<2*std(subK_Area_h2));
subK_Area_z2=subK_Area_z2(abs(subK_Area_z2-mean(subK_Area_z2))<2*std(subK_Area_z2));
subK_Area_hall=subK_Area_hall(abs(subK_Area_hall-mean(subK_Area_hall))<2*std(subK_Area_hall));
subK_Area_zall=subK_Area_zall(abs(subK_Area_zall-mean(subK_Area_zall))<2*std(subK_Area_zall));
subJ_Area_h1=subJ_Area_h1(abs(subJ_Area_h1-mean(subJ_Area_h1))<2*std(subJ_Area_h1));
subJ_Area_z1=subJ_Area_z1(abs(subJ_Area_z1-mean(subJ_Area_z1))<2*std(subJ_Area_z1));
subJ_Area_h2=subJ_Area_h2(abs(subJ_Area_h2-mean(subJ_Area_h2))<2*std(subJ_Area_h2));
subJ_Area_z2=subJ_Area_z2(abs(subJ_Area_z2-mean(subJ_Area_z2))<2*std(subJ_Area_z2));
subJ_Area_hall=subJ_Area_hall(abs(subJ_Area_hall-mean(subJ_Area_hall))<2*std(subJ_Area_hall));
subJ_Area_zall=subJ_Area_zall(abs(subJ_Area_zall-mean(subJ_Area_zall))<2*std(subJ_Area_zall));
subK_Area_h1=subK_Area_h1(abs(subK_Area_h1-mean(subK_Area_h1))<2*std(subK_Area_h1));
subK_Area_z1=subK_Area_z1(abs(subK_Area_z1-mean(subK_Area_z1))<2*std(subK_Area_z1));
subK_Area_h2=subK_Area_h2(abs(subK_Area_h2-mean(subK_Area_h2))<2*std(subK_Area_h2));
subK_Area_z2=subK_Area_z2(abs(subK_Area_z2-mean(subK_Area_z2))<2*std(subK_Area_z2));
subK_Area_hall=subK_Area_hall(abs(subK_Area_hall-mean(subK_Area_hall))<2*std(subK_Area_hall));
subK_Area_zall=subK_Area_zall(abs(subK_Area_zall-mean(subK_Area_zall))<2*std(subK_Area_zall));
subL_Area_h1=subL_Area_h1(abs(subL_Area_h1-mean(subL_Area_h1))<2*std(subL_Area_h1));
subL_Area_z1=subL_Area_z1(abs(subL_Area_z1-mean(subL_Area_z1))<2*std(subL_Area_z1));
subL_Area_h2=subL_Area_h2(abs(subL_Area_h2-mean(subL_Area_h2))<2*std(subL_Area_h2));
subL_Area_z2=subL_Area_z2(abs(subL_Area_z2-mean(subL_Area_z2))<2*std(subL_Area_z2));
subL_Area_hall=subL_Area_hall(abs(subL_Area_hall-mean(subL_Area_hall))<2*std(subL_Area_hall));
subL_Area_zall=subL_Area_zall(abs(subL_Area_zall-mean(subL_Area_zall))<2*std(subL_Area_zall));
subM_Area_h1=subM_Area_h1(abs(subM_Area_h1-mean(subM_Area_h1))<2*std(subM_Area_h1));
subM_Area_z1=subM_Area_z1(abs(subM_Area_z1-mean(subM_Area_z1))<2*std(subM_Area_z1));
subM_Area_h2=subM_Area_h2(abs(subM_Area_h2-mean(subM_Area_h2))<2*std(subM_Area_h2));
subM_Area_z2=subM_Area_z2(abs(subM_Area_z2-mean(subM_Area_z2))<2*std(subM_Area_z2));
subM_Area_hall=subM_Area_hall(abs(subM_Area_hall-mean(subM_Area_hall))<2*std(subM_Area_hall));
subM_Area_zall=subM_Area_zall(abs(subM_Area_zall-mean(subM_Area_zall))<2*std(subM_Area_zall));



% h1=[mean(subA_Area_h1) mean(subC_Area_h1) mean(subE_Area_h1) mean(subK_Area_h1) mean(subL_Area_h1) mean(subM_Area_h1)];
% 
% z1=[mean(subA_Area_z1) mean(subC_Area_z1) mean(subE_Area_z1) mean(subK_Area_z1) mean(subL_Area_z1) mean(subM_Area_z1)];
% 
% h2=[mean(subA_Area_h2) mean(subC_Area_h2) mean(subE_Area_h2) mean(subK_Area_h2) mean(subL_Area_h2) mean(subM_Area_h2)];
% 
% z2=[mean(subA_Area_z2) mean(subC_Area_z2) mean(subE_Area_z2) mean(subK_Area_z2) mean(subL_Area_z2) mean(subM_Area_z2)];
% 
% hall=[mean(subA_Area_hall) mean(subC_Area_hall) mean(subE_Area_hall) mean(subK_Area_hall) mean(subL_Area_hall) mean(subM_Area_hall)];
% 
% zall=[mean(subA_Area_zall) mean(subC_Area_zall) mean(subE_Area_zall) mean(subK_Area_zall) mean(subL_Area_zall) mean(subM_Area_zall)];

%subA
figure
subplot(1,3,1)
plot(1,subA_Area_h1,'o')
hold on
plot(2,subA_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subA_Area_z1)-mean(subA_Area_h1);
len=nchoosek(size(subA_Area_h1,2)+size(subA_Area_z1,2),size(subA_Area_h1,2));
perm=[subA_Area_h1 subA_Area_z1];
perm1=combnk(perm,size(subA_Area_h1,2));
pa=zeros(len,size(subA_Area_h1,2));
pb=zeros(len,size(subA_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subA_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subA_Area_h2,'o')
hold on
plot(2,subA_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subA_Area_z2)-mean(subA_Area_h2);
len=nchoosek(size(subA_Area_h2,2)+size(subA_Area_z2,2),size(subA_Area_h2,2));
perm=[subA_Area_h2 subA_Area_z2];
perm1=combnk(perm,size(subA_Area_h2,2));
pa=zeros(len,size(subA_Area_h2,2));
pb=zeros(len,size(subA_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subA_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subA_Area_hall,'o')
hold on
plot(2,subA_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subA_Area_zall)-mean(subA_Area_hall);
len=nchoosek(size(subA_Area_hall,2)+size(subA_Area_zall,2),size(subA_Area_hall,2));
perm=[subA_Area_hall subA_Area_zall];
perm1=combnk(perm,size(subA_Area_hall,2));
pa=zeros(len,size(subA_Area_hall,2));
pb=zeros(len,size(subA_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subA_p3=sum(Ds>=Dobs)/len;

%subB
figure
subplot(1,3,1)
plot(1,subB_Area_h1,'o')
hold on
plot(2,subB_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subB_Area_z1)-mean(subB_Area_h1);
len=nchoosek(size(subB_Area_h1,2)+size(subB_Area_z1,2),size(subB_Area_h1,2));
perm=[subB_Area_h1 subB_Area_z1];
perm1=combnk(perm,size(subB_Area_h1,2));
pa=zeros(len,size(subB_Area_h1,2));
pb=zeros(len,size(subB_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subB_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subB_Area_h2,'o')
hold on
plot(2,subB_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subB_Area_z2)-mean(subB_Area_h2);
len=nchoosek(size(subB_Area_h2,2)+size(subB_Area_z2,2),size(subB_Area_h2,2));
perm=[subB_Area_h2 subB_Area_z2];
perm1=combnk(perm,size(subB_Area_h2,2));
pa=zeros(len,size(subB_Area_h2,2));
pb=zeros(len,size(subB_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subB_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subB_Area_hall,'o')
hold on
plot(2,subB_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subB_Area_zall)-mean(subB_Area_hall);
len=nchoosek(size(subB_Area_hall,2)+size(subB_Area_zall,2),size(subB_Area_hall,2));
perm=[subB_Area_hall subB_Area_zall];
perm1=combnk(perm,size(subB_Area_hall,2));
pa=zeros(len,size(subB_Area_hall,2));
pb=zeros(len,size(subB_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subB_p3=sum(Ds>=Dobs)/len;

%subC
figure
subplot(1,3,1)
plot(1,subC_Area_h1,'o')
hold on
plot(2,subC_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subC_Area_z1)-mean(subC_Area_h1);
len=nchoosek(size(subC_Area_h1,2)+size(subC_Area_z1,2),size(subC_Area_h1,2));
perm=[subC_Area_h1 subC_Area_z1];
perm1=combnk(perm,size(subC_Area_h1,2));
pa=zeros(len,size(subC_Area_h1,2));
pb=zeros(len,size(subC_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subC_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subC_Area_h2,'o')
hold on
plot(2,subC_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subC_Area_z2)-mean(subC_Area_h2);
len=nchoosek(size(subC_Area_h2,2)+size(subC_Area_z2,2),size(subC_Area_h2,2));
perm=[subC_Area_h2 subC_Area_z2];
perm1=combnk(perm,size(subC_Area_h2,2));
pa=zeros(len,size(subC_Area_h2,2));
pb=zeros(len,size(subC_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subC_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subC_Area_hall,'o')
hold on
plot(2,subC_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subC_Area_zall)-mean(subC_Area_hall);
len=nchoosek(size(subC_Area_hall,2)+size(subC_Area_zall,2),size(subC_Area_hall,2));
perm=[subC_Area_hall subC_Area_zall];
perm1=combnk(perm,size(subC_Area_hall,2));
pa=zeros(len,size(subC_Area_hall,2));
pb=zeros(len,size(subC_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subC_p3=sum(Ds>=Dobs)/len;

%subD
figure
subplot(1,3,1)
plot(1,subD_Area_h1,'o')
hold on
plot(2,subD_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subD_Area_z1)-mean(subD_Area_h1);
len=nchoosek(size(subD_Area_h1,2)+size(subD_Area_z1,2),size(subD_Area_h1,2));
perm=[subD_Area_h1 subD_Area_z1];
perm1=combnk(perm,size(subD_Area_h1,2));
pa=zeros(len,size(subD_Area_h1,2));
pb=zeros(len,size(subD_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subD_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subD_Area_h2,'o')
hold on
plot(2,subD_Area_z2,'o')
for i=1:6
plot([1,2],[subD_Area_h2(i),subD_Area_z2(i)],'-o')
end
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subD_Area_z2)-mean(subD_Area_h2);
len=nchoosek(size(subD_Area_h2,2)+size(subD_Area_z2,2),size(subD_Area_h2,2));
perm=[subD_Area_h2 subD_Area_z2];
perm1=combnk(perm,size(subD_Area_h2,2));
pa=zeros(len,size(subD_Area_h2,2));
pb=zeros(len,size(subD_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subD_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subD_Area_hall,'o')
hold on
plot(2,subD_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subD_Area_zall)-mean(subD_Area_hall);
len=nchoosek(size(subD_Area_hall,2)+size(subD_Area_zall,2),size(subD_Area_hall,2));
perm=[subD_Area_hall subD_Area_zall];
perm1=combnk(perm,size(subD_Area_hall,2));
pa=zeros(len,size(subD_Area_hall,2));
pb=zeros(len,size(subD_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subD_p3=sum(Ds>=Dobs)/len;

%subE
figure
subplot(1,3,1)
plot(1,subE_Area_h1,'o')
hold on
plot(2,subE_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subE_Area_z1)-mean(subE_Area_h1);
len=nchoosek(size(subE_Area_h1,2)+size(subE_Area_z1,2),size(subE_Area_h1,2));
perm=[subE_Area_h1 subE_Area_z1];
perm1=combnk(perm,size(subE_Area_h1,2));
pa=zeros(len,size(subE_Area_h1,2));
pb=zeros(len,size(subE_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subE_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subE_Area_h2,'o')
hold on
plot(2,subE_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subE_Area_z2)-mean(subE_Area_h2);
len=nchoosek(size(subE_Area_h2,2)+size(subE_Area_z2,2),size(subE_Area_h2,2));
perm=[subE_Area_h2 subE_Area_z2];
perm1=combnk(perm,size(subE_Area_h2,2));
pa=zeros(len,size(subE_Area_h2,2));
pb=zeros(len,size(subE_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subE_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subE_Area_hall,'o')
hold on
plot(2,subE_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subE_Area_zall)-mean(subE_Area_hall);
len=nchoosek(size(subE_Area_hall,2)+size(subE_Area_zall,2),size(subE_Area_hall,2));
perm=[subE_Area_hall subE_Area_zall];
perm1=combnk(perm,size(subE_Area_hall,2));
pa=zeros(len,size(subE_Area_hall,2));
pb=zeros(len,size(subE_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subE_p3=sum(Ds>=Dobs)/len;

%subF
figure
subplot(1,3,1)
plot(1,subF_Area_h1,'o')
hold on
plot(2,subF_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subF_Area_z1)-mean(subF_Area_h1);
len=nchoosek(size(subF_Area_h1,2)+size(subF_Area_z1,2),size(subF_Area_h1,2));
perm=[subF_Area_h1 subF_Area_z1];
perm1=combnk(perm,size(subF_Area_h1,2));
pa=zeros(len,size(subF_Area_h1,2));
pb=zeros(len,size(subF_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subF_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subF_Area_h2,'o')
hold on
plot(2,subF_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subF_Area_z2)-mean(subF_Area_h2);
len=nchoosek(size(subF_Area_h2,2)+size(subF_Area_z2,2),size(subF_Area_h2,2));
perm=[subF_Area_h2 subF_Area_z2];
perm1=combnk(perm,size(subF_Area_h2,2));
pa=zeros(len,size(subF_Area_h2,2));
pb=zeros(len,size(subF_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subF_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subF_Area_hall,'o')
hold on
plot(2,subF_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subF_Area_zall)-mean(subF_Area_hall);
len=nchoosek(size(subF_Area_hall,2)+size(subF_Area_zall,2),size(subF_Area_hall,2));
perm=[subF_Area_hall subF_Area_zall];
perm1=combnk(perm,size(subF_Area_hall,2));
pa=zeros(len,size(subF_Area_hall,2));
pb=zeros(len,size(subF_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subF_p3=sum(Ds>=Dobs)/len;

%subG
figure
subplot(1,3,1)
plot(1,subG_Area_h1,'o')
hold on
plot(2,subG_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subG_Area_z1)-mean(subG_Area_h1);
len=nchoosek(size(subG_Area_h1,2)+size(subG_Area_z1,2),size(subG_Area_h1,2));
perm=[subG_Area_h1 subG_Area_z1];
perm1=combnk(perm,size(subG_Area_h1,2));
pa=zeros(len,size(subG_Area_h1,2));
pb=zeros(len,size(subG_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subG_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subG_Area_h2,'o')
hold on
plot(2,subG_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subG_Area_z2)-mean(subG_Area_h2);
len=nchoosek(size(subG_Area_h2,2)+size(subG_Area_z2,2),size(subG_Area_h2,2));
perm=[subG_Area_h2 subG_Area_z2];
perm1=combnk(perm,size(subG_Area_h2,2));
pa=zeros(len,size(subG_Area_h2,2));
pb=zeros(len,size(subG_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subG_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subG_Area_hall,'o')
hold on
plot(2,subG_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subG_Area_zall)-mean(subG_Area_hall);
len=nchoosek(size(subG_Area_hall,2)+size(subG_Area_zall,2),size(subG_Area_hall,2));
perm=[subG_Area_hall subG_Area_zall];
perm1=combnk(perm,size(subG_Area_hall,2));
pa=zeros(len,size(subG_Area_hall,2));
pb=zeros(len,size(subG_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subG_p3=sum(Ds>=Dobs)/len;

%subH
figure
subplot(1,3,1)
plot(1,subH_Area_h1,'o')
hold on
plot(2,subH_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subH_Area_z1)-mean(subH_Area_h1);
len=nchoosek(size(subH_Area_h1,2)+size(subH_Area_z1,2),size(subH_Area_h1,2));
perm=[subH_Area_h1 subH_Area_z1];
perm1=combnk(perm,size(subH_Area_h1,2));
pa=zeros(len,size(subH_Area_h1,2));
pb=zeros(len,size(subH_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subH_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subH_Area_h2,'o')
hold on
plot(2,subH_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subH_Area_z2)-mean(subH_Area_h2);
len=nchoosek(size(subH_Area_h2,2)+size(subH_Area_z2,2),size(subH_Area_h2,2));
perm=[subH_Area_h2 subH_Area_z2];
perm1=combnk(perm,size(subH_Area_h2,2));
pa=zeros(len,size(subH_Area_h2,2));
pb=zeros(len,size(subH_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subH_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subH_Area_hall,'o')
hold on
plot(2,subH_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subH_Area_zall)-mean(subH_Area_hall);
len=nchoosek(size(subH_Area_hall,2)+size(subH_Area_zall,2),size(subH_Area_hall,2));
perm=[subH_Area_hall subH_Area_zall];
perm1=combnk(perm,size(subH_Area_hall,2));
pa=zeros(len,size(subH_Area_hall,2));
pb=zeros(len,size(subH_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subH_p3=sum(Ds>=Dobs)/len;

%subI
figure
subplot(1,3,1)
plot(1,subI_Area_h1,'o')
hold on
plot(2,subI_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subI_Area_z1)-mean(subI_Area_h1);
len=nchoosek(size(subI_Area_h1,2)+size(subI_Area_z1,2),size(subI_Area_h1,2));
perm=[subI_Area_h1 subI_Area_z1];
perm1=combnk(perm,size(subI_Area_h1,2));
pa=zeros(len,size(subI_Area_h1,2));
pb=zeros(len,size(subI_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subI_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subI_Area_h2,'o')
hold on
plot(2,subI_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subI_Area_z2)-mean(subI_Area_h2);
len=nchoosek(size(subI_Area_h2,2)+size(subI_Area_z2,2),size(subI_Area_h2,2));
perm=[subI_Area_h2 subI_Area_z2];
perm1=combnk(perm,size(subI_Area_h2,2));
pa=zeros(len,size(subI_Area_h2,2));
pb=zeros(len,size(subI_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subI_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subI_Area_hall,'o')
hold on
plot(2,subI_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subI_Area_zall)-mean(subI_Area_hall);
len=nchoosek(size(subI_Area_hall,2)+size(subI_Area_zall,2),size(subI_Area_hall,2));
perm=[subI_Area_hall subI_Area_zall];
perm1=combnk(perm,size(subI_Area_hall,2));
pa=zeros(len,size(subI_Area_hall,2));
pb=zeros(len,size(subI_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subI_p3=sum(Ds>=Dobs)/len;

%subJ
figure
subplot(1,3,1)
plot(1,subJ_Area_h1,'o')
hold on
plot(2,subJ_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subJ_Area_z1)-mean(subJ_Area_h1);
len=nchoosek(size(subJ_Area_h1,2)+size(subJ_Area_z1,2),size(subJ_Area_h1,2));
perm=[subJ_Area_h1 subJ_Area_z1];
perm1=combnk(perm,size(subJ_Area_h1,2));
pa=zeros(len,size(subJ_Area_h1,2));
pb=zeros(len,size(subJ_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subJ_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subJ_Area_h2,'o')
hold on
plot(2,subJ_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subJ_Area_z2)-mean(subJ_Area_h2);
len=nchoosek(size(subJ_Area_h2,2)+size(subJ_Area_z2,2),size(subJ_Area_h2,2));
perm=[subJ_Area_h2 subJ_Area_z2];
perm1=combnk(perm,size(subJ_Area_h2,2));
pa=zeros(len,size(subJ_Area_h2,2));
pb=zeros(len,size(subJ_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subJ_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subJ_Area_hall,'o')
hold on
plot(2,subJ_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subJ_Area_zall)-mean(subJ_Area_hall);
len=nchoosek(size(subJ_Area_hall,2)+size(subJ_Area_zall,2),size(subJ_Area_hall,2));
perm=[subJ_Area_hall subJ_Area_zall];
perm1=combnk(perm,size(subJ_Area_hall,2));
pa=zeros(len,size(subJ_Area_hall,2));
pb=zeros(len,size(subJ_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subJ_p3=sum(Ds>=Dobs)/len;

%subK
figure
subplot(1,3,1)
plot(1,subK_Area_h1,'o')
hold on
plot(2,subK_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subK_Area_z1)-mean(subK_Area_h1);
len=nchoosek(size(subK_Area_h1,2)+size(subK_Area_z1,2),size(subK_Area_h1,2));
perm=[subK_Area_h1 subK_Area_z1];
perm1=combnk(perm,size(subK_Area_h1,2));
pa=zeros(len,size(subK_Area_h1,2));
pb=zeros(len,size(subK_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subK_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subK_Area_h2,'o')
hold on
plot(2,subK_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subK_Area_z2)-mean(subK_Area_h2);
len=nchoosek(size(subK_Area_h2,2)+size(subK_Area_z2,2),size(subK_Area_h2,2));
perm=[subK_Area_h2 subK_Area_z2];
perm1=combnk(perm,size(subK_Area_h2,2));
pa=zeros(len,size(subK_Area_h2,2));
pb=zeros(len,size(subK_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subK_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subK_Area_hall,'o')
hold on
plot(2,subK_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subK_Area_zall)-mean(subK_Area_hall);
len=nchoosek(size(subK_Area_hall,2)+size(subK_Area_zall,2),size(subK_Area_hall,2));
perm=[subK_Area_hall subK_Area_zall];
perm1=combnk(perm,size(subK_Area_hall,2));
pa=zeros(len,size(subK_Area_hall,2));
pb=zeros(len,size(subK_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subK_p3=sum(Ds>=Dobs)/len;

%subL
figure
subplot(1,3,1)
plot(1,subL_Area_h1,'o')
hold on
plot(2,subL_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subL_Area_z1)-mean(subL_Area_h1);
len=nchoosek(size(subL_Area_h1,2)+size(subL_Area_z1,2),size(subL_Area_h1,2));
perm=[subL_Area_h1 subL_Area_z1];
perm1=combnk(perm,size(subL_Area_h1,2));
pa=zeros(len,size(subL_Area_h1,2));
pb=zeros(len,size(subL_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subL_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subL_Area_h2,'o')
hold on
plot(2,subL_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subL_Area_z2)-mean(subL_Area_h2);
len=nchoosek(size(subL_Area_h2,2)+size(subL_Area_z2,2),size(subL_Area_h2,2));
perm=[subL_Area_h2 subL_Area_z2];
perm1=combnk(perm,size(subL_Area_h2,2));
pa=zeros(len,size(subL_Area_h2,2));
pb=zeros(len,size(subL_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subL_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subL_Area_hall,'o')
hold on
plot(2,subL_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subL_Area_zall)-mean(subL_Area_hall);
len=nchoosek(size(subL_Area_hall,2)+size(subL_Area_zall,2),size(subL_Area_hall,2));
perm=[subL_Area_hall subL_Area_zall];
perm1=combnk(perm,size(subL_Area_hall,2));
pa=zeros(len,size(subL_Area_hall,2));
pb=zeros(len,size(subL_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subL_p3=sum(Ds>=Dobs)/len;

%subM
figure
subplot(1,3,1)
plot(1,subM_Area_h1,'o')
hold on
plot(2,subM_Area_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subM_Area_z1)-mean(subM_Area_h1);
len=nchoosek(size(subM_Area_h1,2)+size(subM_Area_z1,2),size(subM_Area_h1,2));
perm=[subM_Area_h1 subM_Area_z1];
perm1=combnk(perm,size(subM_Area_h1,2));
pa=zeros(len,size(subM_Area_h1,2));
pb=zeros(len,size(subM_Area_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subM_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subM_Area_h2,'o')
hold on
plot(2,subM_Area_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subM_Area_z2)-mean(subM_Area_h2);
len=nchoosek(size(subM_Area_h2,2)+size(subM_Area_z2,2),size(subM_Area_h2,2));
perm=[subM_Area_h2 subM_Area_z2];
perm1=combnk(perm,size(subM_Area_h2,2));
pa=zeros(len,size(subM_Area_h2,2));
pb=zeros(len,size(subM_Area_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subM_p2=sum(Ds>=Dobs)/len;

subplot(1,3,3)
plot(1,subM_Area_hall,'o')
hold on
plot(2,subM_Area_zall,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',12)
ylabel('Area')
title('浅化解析')
Dobs=mean(subM_Area_zall)-mean(subM_Area_hall);
len=nchoosek(size(subM_Area_hall,2)+size(subM_Area_zall,2),size(subM_Area_hall,2));
perm=[subM_Area_hall subM_Area_zall];
perm1=combnk(perm,size(subM_Area_hall,2));
pa=zeros(len,size(subM_Area_hall,2));
pb=zeros(len,size(subM_Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subM_p3=sum(Ds>=Dobs)/len;