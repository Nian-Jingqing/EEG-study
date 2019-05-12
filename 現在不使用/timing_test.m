clear all
close all

dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subB\subB(ERD推移等)'); %フォルダ識別
data_mat = 'subB_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subC\subC(ERD推移等)'); %フォルダ識別
data_mat = 'subC_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subD\subD(ERD推移等)'); %フォルダ識別
data_mat = 'subD_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subE\subE(ERD推移等)'); %フォルダ識別
data_mat = 'subE_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subF\subF(ERD推移等)'); %フォルダ識別
data_mat = 'subF_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subG\subG(ERD推移等)'); %フォルダ識別
data_mat = 'subG_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subH\subH(ERD推移等)'); %フォルダ識別
data_mat = 'subH_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subI\subI(ERD推移等)'); %フォルダ識別
data_mat = 'subI_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subJ\subJ(ERD推移等)'); %フォルダ識別
data_mat = 'subJ_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subK\subK(ERD推移等)'); %フォルダ識別
data_mat = 'subK_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subL\subL(ERD推移等)'); %フォルダ識別
data_mat = 'subL_Timing';
load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_Timing';
load([dir,'\',data_mat]); %データ読み取り

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
title('各被験者の実験開始時・終了時のジャンプ閾値の到達時間')

[p,h]=signrank(t1*100,t10*100);


