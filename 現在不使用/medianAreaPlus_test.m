clear all
close all

dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subB\subB(ERD推移等)'); %フォルダ識別
data_mat = 'subB_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subC\subC(ERD推移等)'); %フォルダ識別
data_mat = 'subC_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subD\subD(ERD推移等)'); %フォルダ識別
data_mat = 'subD_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subE\subE(ERD推移等)'); %フォルダ識別
data_mat = 'subE_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subF\subF(ERD推移等)'); %フォルダ識別
data_mat = 'subF_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subG\subG(ERD推移等)'); %フォルダ識別
data_mat = 'subG_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subH\subH(ERD推移等)'); %フォルダ識別
data_mat = 'subH_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subI\subI(ERD推移等)'); %フォルダ識別
data_mat = 'subI_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subJ\subJ(ERD推移等)'); %フォルダ識別
data_mat = 'subJ_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subK\subK(ERD推移等)'); %フォルダ識別
data_mat = 'subK_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subL\subL(ERD推移等)'); %フォルダ識別
data_mat = 'subL_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_areaPlus_median';
load([dir,'\',data_mat]); %データ読み取り



subA_AreaPlus_h1=subA_AreaPlus_h1(find(subA_AreaPlus_h1));
subA_AreaPlus_z1=subA_AreaPlus_z1(find(subA_AreaPlus_z1));
subA_AreaPlus_h2=subA_AreaPlus_h2(find(subA_AreaPlus_h2));
subA_AreaPlus_z2=subA_AreaPlus_z2(find(subA_AreaPlus_z2));
subB_AreaPlus_h1=subB_AreaPlus_h1(find(subB_AreaPlus_h1));
subB_AreaPlus_z1=subB_AreaPlus_z1(find(subB_AreaPlus_z1));
subB_AreaPlus_h2=subB_AreaPlus_h2(find(subB_AreaPlus_h2));
subB_AreaPlus_z2=subB_AreaPlus_z2(find(subB_AreaPlus_z2));
subC_AreaPlus_h1=subC_AreaPlus_h1(find(subC_AreaPlus_h1));
subC_AreaPlus_z1=subC_AreaPlus_z1(find(subC_AreaPlus_z1));
subC_AreaPlus_h2=subC_AreaPlus_h2(find(subC_AreaPlus_h2));
subC_AreaPlus_z2=subC_AreaPlus_z2(find(subC_AreaPlus_z2));
subD_AreaPlus_h1=subD_AreaPlus_h1(find(subD_AreaPlus_h1));
subD_AreaPlus_z1=subD_AreaPlus_z1(find(subD_AreaPlus_z1));
subD_AreaPlus_h2=subD_AreaPlus_h2(find(subD_AreaPlus_h2));
subD_AreaPlus_z2=subD_AreaPlus_z2(find(subD_AreaPlus_z2));
subE_AreaPlus_h1=subE_AreaPlus_h1(find(subE_AreaPlus_h1));
subE_AreaPlus_z1=subE_AreaPlus_z1(find(subE_AreaPlus_z1));
subE_AreaPlus_h2=subE_AreaPlus_h2(find(subE_AreaPlus_h2));
subE_AreaPlus_z2=subE_AreaPlus_z2(find(subE_AreaPlus_z2));
subF_AreaPlus_h1=subF_AreaPlus_h1(find(subF_AreaPlus_h1));
subF_AreaPlus_z1=subF_AreaPlus_z1(find(subF_AreaPlus_z1));
subF_AreaPlus_h2=subF_AreaPlus_h2(find(subF_AreaPlus_h2));
subF_AreaPlus_z2=subF_AreaPlus_z2(find(subF_AreaPlus_z2));
subG_AreaPlus_h1=subG_AreaPlus_h1(find(subG_AreaPlus_h1));
subG_AreaPlus_z1=subG_AreaPlus_z1(find(subG_AreaPlus_z1));
subG_AreaPlus_h2=subG_AreaPlus_h2(find(subG_AreaPlus_h2));
subG_AreaPlus_z2=subG_AreaPlus_z2(find(subG_AreaPlus_z2));
subH_AreaPlus_h1=subH_AreaPlus_h1(find(subH_AreaPlus_h1));
subH_AreaPlus_z1=subH_AreaPlus_z1(find(subH_AreaPlus_z1));
subH_AreaPlus_h2=subH_AreaPlus_h2(find(subH_AreaPlus_h2));
subH_AreaPlus_z2=subH_AreaPlus_z2(find(subH_AreaPlus_z2));
subI_AreaPlus_h1=subI_AreaPlus_h1(find(subI_AreaPlus_h1));
subI_AreaPlus_z1=subI_AreaPlus_z1(find(subI_AreaPlus_z1));
subI_AreaPlus_h2=subI_AreaPlus_h2(find(subI_AreaPlus_h2));
subI_AreaPlus_z2=subI_AreaPlus_z2(find(subI_AreaPlus_z2));
subJ_AreaPlus_h1=subJ_AreaPlus_h1(find(subJ_AreaPlus_h1));
subJ_AreaPlus_z1=subJ_AreaPlus_z1(find(subJ_AreaPlus_z1));
subJ_AreaPlus_h2=subJ_AreaPlus_h2(find(subJ_AreaPlus_h2));
subJ_AreaPlus_z2=subJ_AreaPlus_z2(find(subJ_AreaPlus_z2));
subK_AreaPlus_h1=subK_AreaPlus_h1(find(subK_AreaPlus_h1));
subK_AreaPlus_z1=subK_AreaPlus_z1(find(subK_AreaPlus_z1));
subK_AreaPlus_h2=subK_AreaPlus_h2(find(subK_AreaPlus_h2));
subK_AreaPlus_z2=subK_AreaPlus_z2(find(subK_AreaPlus_z2));
subL_AreaPlus_h1=subL_AreaPlus_h1(find(subL_AreaPlus_h1));
subL_AreaPlus_z1=subL_AreaPlus_z1(find(subL_AreaPlus_z1));
subL_AreaPlus_h2=subL_AreaPlus_h2(find(subL_AreaPlus_h2));
subL_AreaPlus_z2=subL_AreaPlus_z2(find(subL_AreaPlus_z2));
subM_AreaPlus_h1=subM_AreaPlus_h1(find(subM_AreaPlus_h1));
subM_AreaPlus_z1=subM_AreaPlus_z1(find(subM_AreaPlus_z1));
subM_AreaPlus_h2=subM_AreaPlus_h2(find(subM_AreaPlus_h2));
subM_AreaPlus_z2=subM_AreaPlus_z2(find(subM_AreaPlus_z2));
subL_AreaPlus_h1=subL_AreaPlus_h1(find(subL_AreaPlus_h1));
subL_AreaPlus_z1=subL_AreaPlus_z1(find(subL_AreaPlus_z1));
subL_AreaPlus_h2=subL_AreaPlus_h2(find(subL_AreaPlus_h2));
subL_AreaPlus_z2=subL_AreaPlus_z2(find(subL_AreaPlus_z2));

subA_AreaPlus_hall=[subA_AreaPlus_h1 subA_AreaPlus_h2];
subA_AreaPlus_zall=[subA_AreaPlus_z1 subA_AreaPlus_z2];
subB_AreaPlus_hall=[subB_AreaPlus_h1 subB_AreaPlus_h2];
subB_AreaPlus_zall=[subB_AreaPlus_z1 subB_AreaPlus_z2];
subC_AreaPlus_hall=[subC_AreaPlus_h1 subC_AreaPlus_h2];
subC_AreaPlus_zall=[subC_AreaPlus_z1 subC_AreaPlus_z2];
subD_AreaPlus_hall=[subD_AreaPlus_h1 subD_AreaPlus_h2];
subD_AreaPlus_zall=[subD_AreaPlus_z1 subD_AreaPlus_z2];
subE_AreaPlus_hall=[subE_AreaPlus_h1 subE_AreaPlus_h2];
subE_AreaPlus_zall=[subE_AreaPlus_z1 subE_AreaPlus_z2];
subF_AreaPlus_hall=[subF_AreaPlus_h1 subF_AreaPlus_h2];
subF_AreaPlus_zall=[subF_AreaPlus_z1 subF_AreaPlus_z2];
subG_AreaPlus_hall=[subG_AreaPlus_h1 subG_AreaPlus_h2];
subG_AreaPlus_zall=[subG_AreaPlus_z1 subG_AreaPlus_z2];
subH_AreaPlus_hall=[subH_AreaPlus_h1 subH_AreaPlus_h2];
subH_AreaPlus_zall=[subH_AreaPlus_z1 subH_AreaPlus_z2];
subI_AreaPlus_hall=[subI_AreaPlus_h1 subI_AreaPlus_h2];
subI_AreaPlus_zall=[subI_AreaPlus_z1 subI_AreaPlus_z2];
subJ_AreaPlus_hall=[subJ_AreaPlus_h1 subJ_AreaPlus_h2];
subJ_AreaPlus_zall=[subJ_AreaPlus_z1 subJ_AreaPlus_z2];
subK_AreaPlus_hall=[subK_AreaPlus_h1 subK_AreaPlus_h2];
subK_AreaPlus_zall=[subK_AreaPlus_z1 subK_AreaPlus_z2];
subL_AreaPlus_hall=[subL_AreaPlus_h1 subL_AreaPlus_h2];
subL_AreaPlus_zall=[subL_AreaPlus_z1 subL_AreaPlus_z2];
subM_AreaPlus_hall=[subM_AreaPlus_h1 subM_AreaPlus_h2];
subM_AreaPlus_zall=[subM_AreaPlus_z1 subM_AreaPlus_z2];

subA_AreaPlus_h1=subA_AreaPlus_h1(abs(subA_AreaPlus_h1-mean(subA_AreaPlus_h1))<2*std(subA_AreaPlus_h1));
subA_AreaPlus_z1=subA_AreaPlus_z1(abs(subA_AreaPlus_z1-mean(subA_AreaPlus_z1))<2*std(subA_AreaPlus_z1));
subA_AreaPlus_h2=subA_AreaPlus_h2(abs(subA_AreaPlus_h2-mean(subA_AreaPlus_h2))<2*std(subA_AreaPlus_h2));
subA_AreaPlus_z2=subA_AreaPlus_z2(abs(subA_AreaPlus_z2-mean(subA_AreaPlus_z2))<2*std(subA_AreaPlus_z2));
subA_AreaPlus_hall=subA_AreaPlus_hall(abs(subA_AreaPlus_hall-mean(subA_AreaPlus_hall))<2*std(subA_AreaPlus_hall));
subA_AreaPlus_zall=subA_AreaPlus_zall(abs(subA_AreaPlus_zall-mean(subA_AreaPlus_zall))<2*std(subA_AreaPlus_zall));
subB_AreaPlus_h1=subB_AreaPlus_h1(abs(subB_AreaPlus_h1-mean(subB_AreaPlus_h1))<2*std(subB_AreaPlus_h1));
subB_AreaPlus_z1=subB_AreaPlus_z1(abs(subB_AreaPlus_z1-mean(subB_AreaPlus_z1))<2*std(subB_AreaPlus_z1));
subB_AreaPlus_h2=subB_AreaPlus_h2(abs(subB_AreaPlus_h2-mean(subB_AreaPlus_h2))<2*std(subB_AreaPlus_h2));
subB_AreaPlus_z2=subB_AreaPlus_z2(abs(subB_AreaPlus_z2-mean(subB_AreaPlus_z2))<2*std(subB_AreaPlus_z2));
subB_AreaPlus_hall=subB_AreaPlus_hall(abs(subB_AreaPlus_hall-mean(subB_AreaPlus_hall))<2*std(subB_AreaPlus_hall));
subB_AreaPlus_zall=subB_AreaPlus_zall(abs(subB_AreaPlus_zall-mean(subB_AreaPlus_zall))<2*std(subB_AreaPlus_zall));
subC_AreaPlus_h1=subC_AreaPlus_h1(abs(subC_AreaPlus_h1-mean(subC_AreaPlus_h1))<2*std(subC_AreaPlus_h1));
subC_AreaPlus_z1=subC_AreaPlus_z1(abs(subC_AreaPlus_z1-mean(subC_AreaPlus_z1))<2*std(subC_AreaPlus_z1));
subC_AreaPlus_h2=subC_AreaPlus_h2(abs(subC_AreaPlus_h2-mean(subC_AreaPlus_h2))<2*std(subC_AreaPlus_h2));
subC_AreaPlus_z2=subC_AreaPlus_z2(abs(subC_AreaPlus_z2-mean(subC_AreaPlus_z2))<2*std(subC_AreaPlus_z2));
subC_AreaPlus_hall=subC_AreaPlus_hall(abs(subC_AreaPlus_hall-mean(subC_AreaPlus_hall))<2*std(subC_AreaPlus_hall));
subC_AreaPlus_zall=subC_AreaPlus_zall(abs(subC_AreaPlus_zall-mean(subC_AreaPlus_zall))<2*std(subC_AreaPlus_zall));
subD_AreaPlus_h1=subD_AreaPlus_h1(abs(subD_AreaPlus_h1-mean(subD_AreaPlus_h1))<2*std(subD_AreaPlus_h1));
subD_AreaPlus_z1=subD_AreaPlus_z1(abs(subD_AreaPlus_z1-mean(subD_AreaPlus_z1))<2*std(subD_AreaPlus_z1));
subD_AreaPlus_h2=subD_AreaPlus_h2(abs(subD_AreaPlus_h2-mean(subD_AreaPlus_h2))<2*std(subD_AreaPlus_h2));
subD_AreaPlus_z2=subD_AreaPlus_z2(abs(subD_AreaPlus_z2-mean(subD_AreaPlus_z2))<2*std(subD_AreaPlus_z2));
subD_AreaPlus_hall=subD_AreaPlus_hall(abs(subD_AreaPlus_hall-mean(subD_AreaPlus_hall))<2*std(subD_AreaPlus_hall));
subD_AreaPlus_zall=subD_AreaPlus_zall(abs(subD_AreaPlus_zall-mean(subD_AreaPlus_zall))<2*std(subD_AreaPlus_zall));
subE_AreaPlus_h1=subE_AreaPlus_h1(abs(subE_AreaPlus_h1-mean(subE_AreaPlus_h1))<2*std(subE_AreaPlus_h1));
subE_AreaPlus_z1=subE_AreaPlus_z1(abs(subE_AreaPlus_z1-mean(subE_AreaPlus_z1))<2*std(subE_AreaPlus_z1));
subE_AreaPlus_h2=subE_AreaPlus_h2(abs(subE_AreaPlus_h2-mean(subE_AreaPlus_h2))<2*std(subE_AreaPlus_h2));
subE_AreaPlus_z2=subE_AreaPlus_z2(abs(subE_AreaPlus_z2-mean(subE_AreaPlus_z2))<2*std(subE_AreaPlus_z2));
subE_AreaPlus_hall=subE_AreaPlus_hall(abs(subE_AreaPlus_hall-mean(subE_AreaPlus_hall))<2*std(subE_AreaPlus_hall));
subE_AreaPlus_zall=subE_AreaPlus_zall(abs(subE_AreaPlus_zall-mean(subE_AreaPlus_zall))<2*std(subE_AreaPlus_zall));
subF_AreaPlus_h1=subF_AreaPlus_h1(abs(subF_AreaPlus_h1-mean(subF_AreaPlus_h1))<2*std(subF_AreaPlus_h1));
subF_AreaPlus_z1=subF_AreaPlus_z1(abs(subF_AreaPlus_z1-mean(subF_AreaPlus_z1))<2*std(subF_AreaPlus_z1));
subF_AreaPlus_h2=subF_AreaPlus_h2(abs(subF_AreaPlus_h2-mean(subF_AreaPlus_h2))<2*std(subF_AreaPlus_h2));
subF_AreaPlus_z2=subF_AreaPlus_z2(abs(subF_AreaPlus_z2-mean(subF_AreaPlus_z2))<2*std(subF_AreaPlus_z2));
subF_AreaPlus_hall=subF_AreaPlus_hall(abs(subF_AreaPlus_hall-mean(subF_AreaPlus_hall))<2*std(subF_AreaPlus_hall));
subF_AreaPlus_zall=subF_AreaPlus_zall(abs(subF_AreaPlus_zall-mean(subF_AreaPlus_zall))<2*std(subF_AreaPlus_zall));
subG_AreaPlus_h1=subG_AreaPlus_h1(abs(subG_AreaPlus_h1-mean(subG_AreaPlus_h1))<2*std(subG_AreaPlus_h1));
subG_AreaPlus_z1=subG_AreaPlus_z1(abs(subG_AreaPlus_z1-mean(subG_AreaPlus_z1))<2*std(subG_AreaPlus_z1));
subG_AreaPlus_h2=subG_AreaPlus_h2(abs(subG_AreaPlus_h2-mean(subG_AreaPlus_h2))<2*std(subG_AreaPlus_h2));
subG_AreaPlus_z2=subG_AreaPlus_z2(abs(subG_AreaPlus_z2-mean(subG_AreaPlus_z2))<2*std(subG_AreaPlus_z2));
subG_AreaPlus_hall=subG_AreaPlus_hall(abs(subG_AreaPlus_hall-mean(subG_AreaPlus_hall))<2*std(subG_AreaPlus_hall));
subG_AreaPlus_zall=subG_AreaPlus_zall(abs(subG_AreaPlus_zall-mean(subG_AreaPlus_zall))<2*std(subG_AreaPlus_zall));
subH_AreaPlus_h1=subH_AreaPlus_h1(abs(subH_AreaPlus_h1-mean(subH_AreaPlus_h1))<2*std(subH_AreaPlus_h1));
subH_AreaPlus_z1=subH_AreaPlus_z1(abs(subH_AreaPlus_z1-mean(subH_AreaPlus_z1))<2*std(subH_AreaPlus_z1));
subH_AreaPlus_h2=subH_AreaPlus_h2(abs(subH_AreaPlus_h2-mean(subH_AreaPlus_h2))<2*std(subH_AreaPlus_h2));
subH_AreaPlus_z2=subH_AreaPlus_z2(abs(subH_AreaPlus_z2-mean(subH_AreaPlus_z2))<2*std(subH_AreaPlus_z2));
subH_AreaPlus_hall=subH_AreaPlus_hall(abs(subH_AreaPlus_hall-mean(subH_AreaPlus_hall))<2*std(subH_AreaPlus_hall));
subH_AreaPlus_zall=subH_AreaPlus_zall(abs(subH_AreaPlus_zall-mean(subH_AreaPlus_zall))<2*std(subH_AreaPlus_zall));
subI_AreaPlus_h1=subI_AreaPlus_h1(abs(subI_AreaPlus_h1-mean(subI_AreaPlus_h1))<2*std(subI_AreaPlus_h1));
subI_AreaPlus_z1=subI_AreaPlus_z1(abs(subI_AreaPlus_z1-mean(subI_AreaPlus_z1))<2*std(subI_AreaPlus_z1));
subI_AreaPlus_h2=subI_AreaPlus_h2(abs(subI_AreaPlus_h2-mean(subI_AreaPlus_h2))<2*std(subI_AreaPlus_h2));
subI_AreaPlus_z2=subI_AreaPlus_z2(abs(subI_AreaPlus_z2-mean(subI_AreaPlus_z2))<2*std(subI_AreaPlus_z2));
subI_AreaPlus_hall=subI_AreaPlus_hall(abs(subI_AreaPlus_hall-mean(subI_AreaPlus_hall))<2*std(subI_AreaPlus_hall));
subI_AreaPlus_zall=subI_AreaPlus_zall(abs(subI_AreaPlus_zall-mean(subI_AreaPlus_zall))<2*std(subI_AreaPlus_zall));
subJ_AreaPlus_h1=subJ_AreaPlus_h1(abs(subJ_AreaPlus_h1-mean(subJ_AreaPlus_h1))<2*std(subJ_AreaPlus_h1));
subJ_AreaPlus_z1=subJ_AreaPlus_z1(abs(subJ_AreaPlus_z1-mean(subJ_AreaPlus_z1))<2*std(subJ_AreaPlus_z1));
subJ_AreaPlus_h2=subJ_AreaPlus_h2(abs(subJ_AreaPlus_h2-mean(subJ_AreaPlus_h2))<2*std(subJ_AreaPlus_h2));
subJ_AreaPlus_z2=subJ_AreaPlus_z2(abs(subJ_AreaPlus_z2-mean(subJ_AreaPlus_z2))<2*std(subJ_AreaPlus_z2));
subJ_AreaPlus_hall=subJ_AreaPlus_hall(abs(subJ_AreaPlus_hall-mean(subJ_AreaPlus_hall))<2*std(subJ_AreaPlus_hall));
subJ_AreaPlus_zall=subJ_AreaPlus_zall(abs(subJ_AreaPlus_zall-mean(subJ_AreaPlus_zall))<2*std(subJ_AreaPlus_zall));
subK_AreaPlus_h1=subK_AreaPlus_h1(abs(subK_AreaPlus_h1-mean(subK_AreaPlus_h1))<2*std(subK_AreaPlus_h1));
subK_AreaPlus_z1=subK_AreaPlus_z1(abs(subK_AreaPlus_z1-mean(subK_AreaPlus_z1))<2*std(subK_AreaPlus_z1));
subK_AreaPlus_h2=subK_AreaPlus_h2(abs(subK_AreaPlus_h2-mean(subK_AreaPlus_h2))<2*std(subK_AreaPlus_h2));
subK_AreaPlus_z2=subK_AreaPlus_z2(abs(subK_AreaPlus_z2-mean(subK_AreaPlus_z2))<2*std(subK_AreaPlus_z2));
subK_AreaPlus_hall=subK_AreaPlus_hall(abs(subK_AreaPlus_hall-mean(subK_AreaPlus_hall))<2*std(subK_AreaPlus_hall));
subK_AreaPlus_zall=subK_AreaPlus_zall(abs(subK_AreaPlus_zall-mean(subK_AreaPlus_zall))<2*std(subK_AreaPlus_zall));
subJ_AreaPlus_h1=subJ_AreaPlus_h1(abs(subJ_AreaPlus_h1-mean(subJ_AreaPlus_h1))<2*std(subJ_AreaPlus_h1));
subJ_AreaPlus_z1=subJ_AreaPlus_z1(abs(subJ_AreaPlus_z1-mean(subJ_AreaPlus_z1))<2*std(subJ_AreaPlus_z1));
subJ_AreaPlus_h2=subJ_AreaPlus_h2(abs(subJ_AreaPlus_h2-mean(subJ_AreaPlus_h2))<2*std(subJ_AreaPlus_h2));
subJ_AreaPlus_z2=subJ_AreaPlus_z2(abs(subJ_AreaPlus_z2-mean(subJ_AreaPlus_z2))<2*std(subJ_AreaPlus_z2));
subJ_AreaPlus_hall=subJ_AreaPlus_hall(abs(subJ_AreaPlus_hall-mean(subJ_AreaPlus_hall))<2*std(subJ_AreaPlus_hall));
subJ_AreaPlus_zall=subJ_AreaPlus_zall(abs(subJ_AreaPlus_zall-mean(subJ_AreaPlus_zall))<2*std(subJ_AreaPlus_zall));
subK_AreaPlus_h1=subK_AreaPlus_h1(abs(subK_AreaPlus_h1-mean(subK_AreaPlus_h1))<2*std(subK_AreaPlus_h1));
subK_AreaPlus_z1=subK_AreaPlus_z1(abs(subK_AreaPlus_z1-mean(subK_AreaPlus_z1))<2*std(subK_AreaPlus_z1));
subK_AreaPlus_h2=subK_AreaPlus_h2(abs(subK_AreaPlus_h2-mean(subK_AreaPlus_h2))<2*std(subK_AreaPlus_h2));
subK_AreaPlus_z2=subK_AreaPlus_z2(abs(subK_AreaPlus_z2-mean(subK_AreaPlus_z2))<2*std(subK_AreaPlus_z2));
subK_AreaPlus_hall=subK_AreaPlus_hall(abs(subK_AreaPlus_hall-mean(subK_AreaPlus_hall))<2*std(subK_AreaPlus_hall));
subK_AreaPlus_zall=subK_AreaPlus_zall(abs(subK_AreaPlus_zall-mean(subK_AreaPlus_zall))<2*std(subK_AreaPlus_zall));
subL_AreaPlus_h1=subL_AreaPlus_h1(abs(subL_AreaPlus_h1-mean(subL_AreaPlus_h1))<2*std(subL_AreaPlus_h1));
subL_AreaPlus_z1=subL_AreaPlus_z1(abs(subL_AreaPlus_z1-mean(subL_AreaPlus_z1))<2*std(subL_AreaPlus_z1));
subL_AreaPlus_h2=subL_AreaPlus_h2(abs(subL_AreaPlus_h2-mean(subL_AreaPlus_h2))<2*std(subL_AreaPlus_h2));
subL_AreaPlus_z2=subL_AreaPlus_z2(abs(subL_AreaPlus_z2-mean(subL_AreaPlus_z2))<2*std(subL_AreaPlus_z2));
subL_AreaPlus_hall=subL_AreaPlus_hall(abs(subL_AreaPlus_hall-mean(subL_AreaPlus_hall))<2*std(subL_AreaPlus_hall));
subL_AreaPlus_zall=subL_AreaPlus_zall(abs(subL_AreaPlus_zall-mean(subL_AreaPlus_zall))<2*std(subL_AreaPlus_zall));
subM_AreaPlus_h1=subM_AreaPlus_h1(abs(subM_AreaPlus_h1-mean(subM_AreaPlus_h1))<2*std(subM_AreaPlus_h1));
subM_AreaPlus_z1=subM_AreaPlus_z1(abs(subM_AreaPlus_z1-mean(subM_AreaPlus_z1))<2*std(subM_AreaPlus_z1));
subM_AreaPlus_h2=subM_AreaPlus_h2(abs(subM_AreaPlus_h2-mean(subM_AreaPlus_h2))<2*std(subM_AreaPlus_h2));
subM_AreaPlus_z2=subM_AreaPlus_z2(abs(subM_AreaPlus_z2-mean(subM_AreaPlus_z2))<2*std(subM_AreaPlus_z2));
subM_AreaPlus_hall=subM_AreaPlus_hall(abs(subM_AreaPlus_hall-mean(subM_AreaPlus_hall))<2*std(subM_AreaPlus_hall));
subM_AreaPlus_zall=subM_AreaPlus_zall(abs(subM_AreaPlus_zall-mean(subM_AreaPlus_zall))<2*std(subM_AreaPlus_zall));



% h1=[mean(subA_AreaPlus_h1) mean(subC_AreaPlus_h1) mean(subE_AreaPlus_h1) mean(subK_AreaPlus_h1) mean(subL_AreaPlus_h1) mean(subM_AreaPlus_h1)];
% 
% z1=[mean(subA_AreaPlus_z1) mean(subC_AreaPlus_z1) mean(subE_AreaPlus_z1) mean(subK_AreaPlus_z1) mean(subL_AreaPlus_z1) mean(subM_AreaPlus_z1)];
% 
% h2=[mean(subA_AreaPlus_h2) mean(subC_AreaPlus_h2) mean(subE_AreaPlus_h2) mean(subK_AreaPlus_h2) mean(subL_AreaPlus_h2) mean(subM_AreaPlus_h2)];
% 
% z2=[mean(subA_AreaPlus_z2) mean(subC_AreaPlus_z2) mean(subE_AreaPlus_z2) mean(subK_AreaPlus_z2) mean(subL_AreaPlus_z2) mean(subM_AreaPlus_z2)];
% 
% hall=[mean(subA_AreaPlus_hall) mean(subC_AreaPlus_hall) mean(subE_AreaPlus_hall) mean(subK_AreaPlus_hall) mean(subL_AreaPlus_hall) mean(subM_AreaPlus_hall)];
% 
% zall=[mean(subA_AreaPlus_zall) mean(subC_AreaPlus_zall) mean(subE_AreaPlus_zall) mean(subK_AreaPlus_zall) mean(subL_AreaPlus_zall) mean(subM_AreaPlus_zall)];

%subA
figure
subplot(1,3,1)
plot(1,subA_AreaPlus_h1,'o')
hold on
plot(2,subA_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subA_AreaPlus_z1)-mean(subA_AreaPlus_h1);
len=nchoosek(size(subA_AreaPlus_h1,2)+size(subA_AreaPlus_z1,2),size(subA_AreaPlus_h1,2));
perm=[subA_AreaPlus_h1 subA_AreaPlus_z1];
perm1=combnk(perm,size(subA_AreaPlus_h1,2));
pa=zeros(len,size(subA_AreaPlus_h1,2));
pb=zeros(len,size(subA_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subA_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subA_AreaPlus_h2,'o')
hold on
plot(2,subA_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subA_AreaPlus_z2)-mean(subA_AreaPlus_h2);
len=nchoosek(size(subA_AreaPlus_h2,2)+size(subA_AreaPlus_z2,2),size(subA_AreaPlus_h2,2));
perm=[subA_AreaPlus_h2 subA_AreaPlus_z2];
perm1=combnk(perm,size(subA_AreaPlus_h2,2));
pa=zeros(len,size(subA_AreaPlus_h2,2));
pb=zeros(len,size(subA_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subA_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subA_AreaPlus_hall,'o')
% hold on
% plot(2,subA_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subA_AreaPlus_zall)-mean(subA_AreaPlus_hall);
% len=nchoosek(size(subA_AreaPlus_hall,2)+size(subA_AreaPlus_zall,2),size(subA_AreaPlus_hall,2));
% perm=[subA_AreaPlus_hall subA_AreaPlus_zall];
% perm1=combnk(perm,size(subA_AreaPlus_hall,2));
% pa=zeros(len,size(subA_AreaPlus_hall,2));
% pb=zeros(len,size(subA_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subA_p3=sum(Ds>=Dobs)/len;

%subB
figure
subplot(1,3,1)
plot(1,subB_AreaPlus_h1,'o')
hold on
plot(2,subB_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subB_AreaPlus_z1)-mean(subB_AreaPlus_h1);
len=nchoosek(size(subB_AreaPlus_h1,2)+size(subB_AreaPlus_z1,2),size(subB_AreaPlus_h1,2));
perm=[subB_AreaPlus_h1 subB_AreaPlus_z1];
perm1=combnk(perm,size(subB_AreaPlus_h1,2));
pa=zeros(len,size(subB_AreaPlus_h1,2));
pb=zeros(len,size(subB_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subB_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subB_AreaPlus_h2,'o')
hold on
plot(2,subB_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subB_AreaPlus_z2)-mean(subB_AreaPlus_h2);
len=nchoosek(size(subB_AreaPlus_h2,2)+size(subB_AreaPlus_z2,2),size(subB_AreaPlus_h2,2));
perm=[subB_AreaPlus_h2 subB_AreaPlus_z2];
perm1=combnk(perm,size(subB_AreaPlus_h2,2));
pa=zeros(len,size(subB_AreaPlus_h2,2));
pb=zeros(len,size(subB_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subB_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subB_AreaPlus_hall,'o')
% hold on
% plot(2,subB_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subB_AreaPlus_zall)-mean(subB_AreaPlus_hall);
% len=nchoosek(size(subB_AreaPlus_hall,2)+size(subB_AreaPlus_zall,2),size(subB_AreaPlus_hall,2));
% perm=[subB_AreaPlus_hall subB_AreaPlus_zall];
% perm1=combnk(perm,size(subB_AreaPlus_hall,2));
% pa=zeros(len,size(subB_AreaPlus_hall,2));
% pb=zeros(len,size(subB_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subB_p3=sum(Ds>=Dobs)/len;

%subC
figure
subplot(1,3,1)
plot(1,subC_AreaPlus_h1,'o')
hold on
plot(2,subC_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subC_AreaPlus_z1)-mean(subC_AreaPlus_h1);
len=nchoosek(size(subC_AreaPlus_h1,2)+size(subC_AreaPlus_z1,2),size(subC_AreaPlus_h1,2));
perm=[subC_AreaPlus_h1 subC_AreaPlus_z1];
perm1=combnk(perm,size(subC_AreaPlus_h1,2));
pa=zeros(len,size(subC_AreaPlus_h1,2));
pb=zeros(len,size(subC_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subC_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subC_AreaPlus_h2,'o')
hold on
plot(2,subC_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subC_AreaPlus_z2)-mean(subC_AreaPlus_h2);
len=nchoosek(size(subC_AreaPlus_h2,2)+size(subC_AreaPlus_z2,2),size(subC_AreaPlus_h2,2));
perm=[subC_AreaPlus_h2 subC_AreaPlus_z2];
perm1=combnk(perm,size(subC_AreaPlus_h2,2));
pa=zeros(len,size(subC_AreaPlus_h2,2));
pb=zeros(len,size(subC_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subC_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subC_AreaPlus_hall,'o')
% hold on
% plot(2,subC_AreaPlus_zall,'o')
% for i=1:6
% plot([1,2],[subC_AreaPlus_hall(i),subC_AreaPlus_zall(i)],'-o')
% end
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subC_AreaPlus_zall)-mean(subC_AreaPlus_hall);
% len=nchoosek(size(subC_AreaPlus_hall,2)+size(subC_AreaPlus_zall,2),size(subC_AreaPlus_hall,2));
% perm=[subC_AreaPlus_hall subC_AreaPlus_zall];
% perm1=combnk(perm,size(subC_AreaPlus_hall,2));
% pa=zeros(len,size(subC_AreaPlus_hall,2));
% pb=zeros(len,size(subC_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subC_p3=sum(Ds>=Dobs)/len;

%subD
figure
subplot(1,3,1)
plot(1,subD_AreaPlus_h1,'o')
hold on
plot(2,subD_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subD_AreaPlus_z1)-mean(subD_AreaPlus_h1);
len=nchoosek(size(subD_AreaPlus_h1,2)+size(subD_AreaPlus_z1,2),size(subD_AreaPlus_h1,2));
perm=[subD_AreaPlus_h1 subD_AreaPlus_z1];
perm1=combnk(perm,size(subD_AreaPlus_h1,2));
pa=zeros(len,size(subD_AreaPlus_h1,2));
pb=zeros(len,size(subD_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subD_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subD_AreaPlus_h2,'o')
hold on
plot(2,subD_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subD_AreaPlus_z2)-mean(subD_AreaPlus_h2);
len=nchoosek(size(subD_AreaPlus_h2,2)+size(subD_AreaPlus_z2,2),size(subD_AreaPlus_h2,2));
perm=[subD_AreaPlus_h2 subD_AreaPlus_z2];
perm1=combnk(perm,size(subD_AreaPlus_h2,2));
pa=zeros(len,size(subD_AreaPlus_h2,2));
pb=zeros(len,size(subD_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subD_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subD_AreaPlus_hall,'o')
% hold on
% plot(2,subD_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subD_AreaPlus_zall)-mean(subD_AreaPlus_hall);
% len=nchoosek(size(subD_AreaPlus_hall,2)+size(subD_AreaPlus_zall,2),size(subD_AreaPlus_hall,2));
% perm=[subD_AreaPlus_hall subD_AreaPlus_zall];
% perm1=combnk(perm,size(subD_AreaPlus_hall,2));
% pa=zeros(len,size(subD_AreaPlus_hall,2));
% pb=zeros(len,size(subD_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subD_p3=sum(Ds>=Dobs)/len;

%subE
figure
subplot(1,3,1)
plot(1,subE_AreaPlus_h1,'o')
hold on
plot(2,subE_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subE_AreaPlus_z1)-mean(subE_AreaPlus_h1);
len=nchoosek(size(subE_AreaPlus_h1,2)+size(subE_AreaPlus_z1,2),size(subE_AreaPlus_h1,2));
perm=[subE_AreaPlus_h1 subE_AreaPlus_z1];
perm1=combnk(perm,size(subE_AreaPlus_h1,2));
pa=zeros(len,size(subE_AreaPlus_h1,2));
pb=zeros(len,size(subE_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subE_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subE_AreaPlus_h2,'o')
hold on
plot(2,subE_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subE_AreaPlus_z2)-mean(subE_AreaPlus_h2);
len=nchoosek(size(subE_AreaPlus_h2,2)+size(subE_AreaPlus_z2,2),size(subE_AreaPlus_h2,2));
perm=[subE_AreaPlus_h2 subE_AreaPlus_z2];
perm1=combnk(perm,size(subE_AreaPlus_h2,2));
pa=zeros(len,size(subE_AreaPlus_h2,2));
pb=zeros(len,size(subE_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subE_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subE_AreaPlus_hall,'o')
% hold on
% plot(2,subE_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subE_AreaPlus_zall)-mean(subE_AreaPlus_hall);
% len=nchoosek(size(subE_AreaPlus_hall,2)+size(subE_AreaPlus_zall,2),size(subE_AreaPlus_hall,2));
% perm=[subE_AreaPlus_hall subE_AreaPlus_zall];
% perm1=combnk(perm,size(subE_AreaPlus_hall,2));
% pa=zeros(len,size(subE_AreaPlus_hall,2));
% pb=zeros(len,size(subE_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subE_p3=sum(Ds>=Dobs)/len;

%subF
figure
subplot(1,3,1)
plot(1,subF_AreaPlus_h1,'o')
hold on
plot(2,subF_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subF_AreaPlus_z1)-mean(subF_AreaPlus_h1);
len=nchoosek(size(subF_AreaPlus_h1,2)+size(subF_AreaPlus_z1,2),size(subF_AreaPlus_h1,2));
perm=[subF_AreaPlus_h1 subF_AreaPlus_z1];
perm1=combnk(perm,size(subF_AreaPlus_h1,2));
pa=zeros(len,size(subF_AreaPlus_h1,2));
pb=zeros(len,size(subF_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subF_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subF_AreaPlus_h2,'o')
hold on
plot(2,subF_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subF_AreaPlus_z2)-mean(subF_AreaPlus_h2);
len=nchoosek(size(subF_AreaPlus_h2,2)+size(subF_AreaPlus_z2,2),size(subF_AreaPlus_h2,2));
perm=[subF_AreaPlus_h2 subF_AreaPlus_z2];
perm1=combnk(perm,size(subF_AreaPlus_h2,2));
pa=zeros(len,size(subF_AreaPlus_h2,2));
pb=zeros(len,size(subF_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subF_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subF_AreaPlus_hall,'o')
% hold on
% plot(2,subF_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subF_AreaPlus_zall)-mean(subF_AreaPlus_hall);
% len=nchoosek(size(subF_AreaPlus_hall,2)+size(subF_AreaPlus_zall,2),size(subF_AreaPlus_hall,2));
% perm=[subF_AreaPlus_hall subF_AreaPlus_zall];
% perm1=combnk(perm,size(subF_AreaPlus_hall,2));
% pa=zeros(len,size(subF_AreaPlus_hall,2));
% pb=zeros(len,size(subF_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subF_p3=sum(Ds>=Dobs)/len;

%subG
figure
subplot(1,3,1)
plot(1,subG_AreaPlus_h1,'o')
hold on
plot(2,subG_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subG_AreaPlus_z1)-mean(subG_AreaPlus_h1);
len=nchoosek(size(subG_AreaPlus_h1,2)+size(subG_AreaPlus_z1,2),size(subG_AreaPlus_h1,2));
perm=[subG_AreaPlus_h1 subG_AreaPlus_z1];
perm1=combnk(perm,size(subG_AreaPlus_h1,2));
pa=zeros(len,size(subG_AreaPlus_h1,2));
pb=zeros(len,size(subG_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subG_p1=sum(Ds>=Dobs)/len;

% subplot(1,3,2)
% plot(1,subG_AreaPlus_h2,'o')
% hold on
% plot(2,subG_AreaPlus_z2,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subG_AreaPlus_z2)-mean(subG_AreaPlus_h2);
% len=nchoosek(size(subG_AreaPlus_h2,2)+size(subG_AreaPlus_z2,2),size(subG_AreaPlus_h2,2));
% perm=[subG_AreaPlus_h2 subG_AreaPlus_z2];
% perm1=combnk(perm,size(subG_AreaPlus_h2,2));
% pa=zeros(len,size(subG_AreaPlus_h2,2));
% pb=zeros(len,size(subG_AreaPlus_z2,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subG_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subG_AreaPlus_hall,'o')
% hold on
% plot(2,subG_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subG_AreaPlus_zall)-mean(subG_AreaPlus_hall);
% len=nchoosek(size(subG_AreaPlus_hall,2)+size(subG_AreaPlus_zall,2),size(subG_AreaPlus_hall,2));
% perm=[subG_AreaPlus_hall subG_AreaPlus_zall];
% perm1=combnk(perm,size(subG_AreaPlus_hall,2));
% pa=zeros(len,size(subG_AreaPlus_hall,2));
% pb=zeros(len,size(subG_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subG_p3=sum(Ds>=Dobs)/len;

%subH
figure
subplot(1,3,1)
plot(1,subH_AreaPlus_h1,'o')
hold on
plot(2,subH_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subH_AreaPlus_z1)-mean(subH_AreaPlus_h1);
len=nchoosek(size(subH_AreaPlus_h1,2)+size(subH_AreaPlus_z1,2),size(subH_AreaPlus_h1,2));
perm=[subH_AreaPlus_h1 subH_AreaPlus_z1];
perm1=combnk(perm,size(subH_AreaPlus_h1,2));
pa=zeros(len,size(subH_AreaPlus_h1,2));
pb=zeros(len,size(subH_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subH_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subH_AreaPlus_h2,'o')
hold on
plot(2,subH_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subH_AreaPlus_z2)-mean(subH_AreaPlus_h2);
len=nchoosek(size(subH_AreaPlus_h2,2)+size(subH_AreaPlus_z2,2),size(subH_AreaPlus_h2,2));
perm=[subH_AreaPlus_h2 subH_AreaPlus_z2];
perm1=combnk(perm,size(subH_AreaPlus_h2,2));
pa=zeros(len,size(subH_AreaPlus_h2,2));
pb=zeros(len,size(subH_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subH_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subH_AreaPlus_hall,'o')
% hold on
% plot(2,subH_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subH_AreaPlus_zall)-mean(subH_AreaPlus_hall);
% len=nchoosek(size(subH_AreaPlus_hall,2)+size(subH_AreaPlus_zall,2),size(subH_AreaPlus_hall,2));
% perm=[subH_AreaPlus_hall subH_AreaPlus_zall];
% perm1=combnk(perm,size(subH_AreaPlus_hall,2));
% pa=zeros(len,size(subH_AreaPlus_hall,2));
% pb=zeros(len,size(subH_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subH_p3=sum(Ds>=Dobs)/len;

%subI
figure
subplot(1,3,1)
plot(1,subI_AreaPlus_h1,'o')
hold on
plot(2,subI_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subI_AreaPlus_z1)-mean(subI_AreaPlus_h1);
len=nchoosek(size(subI_AreaPlus_h1,2)+size(subI_AreaPlus_z1,2),size(subI_AreaPlus_h1,2));
perm=[subI_AreaPlus_h1 subI_AreaPlus_z1];
perm1=combnk(perm,size(subI_AreaPlus_h1,2));
pa=zeros(len,size(subI_AreaPlus_h1,2));
pb=zeros(len,size(subI_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subI_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subI_AreaPlus_h2,'o')
hold on
plot(2,subI_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subI_AreaPlus_z2)-mean(subI_AreaPlus_h2);
len=nchoosek(size(subI_AreaPlus_h2,2)+size(subI_AreaPlus_z2,2),size(subI_AreaPlus_h2,2));
perm=[subI_AreaPlus_h2 subI_AreaPlus_z2];
perm1=combnk(perm,size(subI_AreaPlus_h2,2));
pa=zeros(len,size(subI_AreaPlus_h2,2));
pb=zeros(len,size(subI_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subI_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subI_AreaPlus_hall,'o')
% hold on
% plot(2,subI_AreaPlus_zall,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subI_AreaPlus_zall)-mean(subI_AreaPlus_hall);
% len=nchoosek(size(subI_AreaPlus_hall,2)+size(subI_AreaPlus_zall,2),size(subI_AreaPlus_hall,2));
% perm=[subI_AreaPlus_hall subI_AreaPlus_zall];
% perm1=combnk(perm,size(subI_AreaPlus_hall,2));
% pa=zeros(len,size(subI_AreaPlus_hall,2));
% pb=zeros(len,size(subI_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subI_p3=sum(Ds>=Dobs)/len;

%subJ
figure
subplot(1,3,1)
plot(1,subJ_AreaPlus_h1,'o')
hold on
plot(2,subJ_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subJ_AreaPlus_z1)-mean(subJ_AreaPlus_h1);
len=nchoosek(size(subJ_AreaPlus_h1,2)+size(subJ_AreaPlus_z1,2),size(subJ_AreaPlus_h1,2));
perm=[subJ_AreaPlus_h1 subJ_AreaPlus_z1];
perm1=combnk(perm,size(subJ_AreaPlus_h1,2));
pa=zeros(len,size(subJ_AreaPlus_h1,2));
pb=zeros(len,size(subJ_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subJ_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subJ_AreaPlus_h2,'o')
hold on
plot(2,subJ_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subJ_AreaPlus_z2)-mean(subJ_AreaPlus_h2);
len=nchoosek(size(subJ_AreaPlus_h2,2)+size(subJ_AreaPlus_z2,2),size(subJ_AreaPlus_h2,2));
perm=[subJ_AreaPlus_h2 subJ_AreaPlus_z2];
perm1=combnk(perm,size(subJ_AreaPlus_h2,2));
pa=zeros(len,size(subJ_AreaPlus_h2,2));
pb=zeros(len,size(subJ_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subJ_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subJ_AreaPlus_hall,'o')
% hold on
% plot(2,subJ_AreaPlus_zall,'o')
% for i=1:6
% plot([1,2],[subJ_AreaPlus_hall(i),subJ_AreaPlus_zall(i)],'-o')
% end
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subJ_AreaPlus_zall)-mean(subJ_AreaPlus_hall);
% len=nchoosek(size(subJ_AreaPlus_hall,2)+size(subJ_AreaPlus_zall,2),size(subJ_AreaPlus_hall,2));
% perm=[subJ_AreaPlus_hall subJ_AreaPlus_zall];
% perm1=combnk(perm,size(subJ_AreaPlus_hall,2));
% pa=zeros(len,size(subJ_AreaPlus_hall,2));
% pb=zeros(len,size(subJ_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subJ_p3=sum(Ds>=Dobs)/len;

%subK
figure
subplot(1,3,1)
plot(1,subK_AreaPlus_h1,'o')
hold on
plot(2,subK_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subK_AreaPlus_z1)-mean(subK_AreaPlus_h1);
len=nchoosek(size(subK_AreaPlus_h1,2)+size(subK_AreaPlus_z1,2),size(subK_AreaPlus_h1,2));
perm=[subK_AreaPlus_h1 subK_AreaPlus_z1];
perm1=combnk(perm,size(subK_AreaPlus_h1,2));
pa=zeros(len,size(subK_AreaPlus_h1,2));
pb=zeros(len,size(subK_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subK_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subK_AreaPlus_h2,'o')
hold on
plot(2,subK_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subK_AreaPlus_z2)-mean(subK_AreaPlus_h2);
len=nchoosek(size(subK_AreaPlus_h2,2)+size(subK_AreaPlus_z2,2),size(subK_AreaPlus_h2,2));
perm=[subK_AreaPlus_h2 subK_AreaPlus_z2];
perm1=combnk(perm,size(subK_AreaPlus_h2,2));
pa=zeros(len,size(subK_AreaPlus_h2,2));
pb=zeros(len,size(subK_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subK_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subK_AreaPlus_hall,'o')
% hold on
% plot(2,subK_AreaPlus_zall,'o')
% for i=1:6
% plot([1,2],[subK_AreaPlus_hall(i),subK_AreaPlus_zall(i)],'-o')
% end
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subK_AreaPlus_zall)-mean(subK_AreaPlus_hall);
% len=nchoosek(size(subK_AreaPlus_hall,2)+size(subK_AreaPlus_zall,2),size(subK_AreaPlus_hall,2));
% perm=[subK_AreaPlus_hall subK_AreaPlus_zall];
% perm1=combnk(perm,size(subK_AreaPlus_hall,2));
% pa=zeros(len,size(subK_AreaPlus_hall,2));
% pb=zeros(len,size(subK_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subK_p3=sum(Ds>=Dobs)/len;

% %subL
% figure
% subplot(1,3,1)
% plot(1,subL_AreaPlus_h1,'o')
% hold on
% plot(2,subL_AreaPlus_z1,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subL_AreaPlus_z1)-mean(subL_AreaPlus_h1);
% len=nchoosek(size(subL_AreaPlus_h1,2)+size(subL_AreaPlus_z1,2),size(subL_AreaPlus_h1,2));
% perm=[subL_AreaPlus_h1 subL_AreaPlus_z1];
% perm1=combnk(perm,size(subL_AreaPlus_h1,2));
% pa=zeros(len,size(subL_AreaPlus_h1,2));
% pb=zeros(len,size(subL_AreaPlus_z1,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subL_p1=sum(Ds>=Dobs)/len;
% 
% subplot(1,3,2)
% plot(1,subL_AreaPlus_h2,'o')
% hold on
% plot(2,subL_AreaPlus_z2,'o')
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subL_AreaPlus_z2)-mean(subL_AreaPlus_h2);
% len=nchoosek(size(subL_AreaPlus_h2,2)+size(subL_AreaPlus_z2,2),size(subL_AreaPlus_h2,2));
% perm=[subL_AreaPlus_h2 subL_AreaPlus_z2];
% perm1=combnk(perm,size(subL_AreaPlus_h2,2));
% pa=zeros(len,size(subL_AreaPlus_h2,2));
% pb=zeros(len,size(subL_AreaPlus_z2,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subL_p2=sum(Ds>=Dobs)/len;
% 
% subplot(1,3,3)
% plot(1,subL_AreaPlus_hall,'o')
% hold on
% plot(2,subL_AreaPlus_zall,'o')
% for i=1:6
% plot([1,2],[subL_AreaPlus_hall(i),subL_AreaPlus_zall(i)],'-o')
% end
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subL_AreaPlus_zall)-mean(subL_AreaPlus_hall);
% len=nchoosek(size(subL_AreaPlus_hall,2)+size(subL_AreaPlus_zall,2),size(subL_AreaPlus_hall,2));
% perm=[subL_AreaPlus_hall subL_AreaPlus_zall];
% perm1=combnk(perm,size(subL_AreaPlus_hall,2));
% pa=zeros(len,size(subL_AreaPlus_hall,2));
% pb=zeros(len,size(subL_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subL_p3=sum(Ds>=Dobs)/len;

%subM
figure
subplot(1,3,1)
plot(1,subM_AreaPlus_h1,'o')
hold on
plot(2,subM_AreaPlus_z1,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subM_AreaPlus_z1)-mean(subM_AreaPlus_h1);
len=nchoosek(size(subM_AreaPlus_h1,2)+size(subM_AreaPlus_z1,2),size(subM_AreaPlus_h1,2));
perm=[subM_AreaPlus_h1 subM_AreaPlus_z1];
perm1=combnk(perm,size(subM_AreaPlus_h1,2));
pa=zeros(len,size(subM_AreaPlus_h1,2));
pb=zeros(len,size(subM_AreaPlus_z1,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subM_p1=sum(Ds>=Dobs)/len;

subplot(1,3,2)
plot(1,subM_AreaPlus_h2,'o')
hold on
plot(2,subM_AreaPlus_z2,'o')
xlim([0 3])
ylim([-200000 100000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',12)
ylabel('AreaPlus')
title('浅化解析')
Dobs=mean(subM_AreaPlus_z2)-mean(subM_AreaPlus_h2);
len=nchoosek(size(subM_AreaPlus_h2,2)+size(subM_AreaPlus_z2,2),size(subM_AreaPlus_h2,2));
perm=[subM_AreaPlus_h2 subM_AreaPlus_z2];
perm1=combnk(perm,size(subM_AreaPlus_h2,2));
pa=zeros(len,size(subM_AreaPlus_h2,2));
pb=zeros(len,size(subM_AreaPlus_z2,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
subM_p2=sum(Ds>=Dobs)/len;

% subplot(1,3,3)
% plot(1,subM_AreaPlus_hall,'o')
% hold on
% plot(2,subM_AreaPlus_zall,'o')
% for i=1:6
% plot([1,2],[subM_AreaPlus_hall(i),subM_AreaPlus_zall(i)],'-o')
% end
% xlim([0 3])
% ylim([-200000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
% set(gca,'FontSize',12)
% ylabel('AreaPlus')
% title('浅化解析')
% Dobs=mean(subM_AreaPlus_zall)-mean(subM_AreaPlus_hall);
% len=nchoosek(size(subM_AreaPlus_hall,2)+size(subM_AreaPlus_zall,2),size(subM_AreaPlus_hall,2));
% perm=[subM_AreaPlus_hall subM_AreaPlus_zall];
% perm1=combnk(perm,size(subM_AreaPlus_hall,2));
% pa=zeros(len,size(subM_AreaPlus_hall,2));
% pb=zeros(len,size(subM_AreaPlus_zall,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% subM_p3=sum(Ds>=Dobs)/len;