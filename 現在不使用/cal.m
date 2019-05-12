clear all
close all

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_hist';
load([dir,'\',data_mat]); %データ読み取り

mediandata=zeros(1,18);
mediandata(1)=round(median(minimum1),1);
mediandata(3)=round(median(minimum2),1);
mediandata(5)=round(median(minimum12),1);
mediandata(7)=round(median(minimum3),1);
mediandata(9)=round(median(minimum4),1);
mediandata(11)=round(median(minimum34),1);
mediandata(13)=round(median(minimum5),1);
mediandata(15)=round(median(minimum6),1);
mediandata(17)=round(median(minimum56),1);

mediandata(2)=round(iqr(minimum1),1);
mediandata(4)=round(iqr(minimum2),1);
mediandata(6)=round(iqr(minimum12),1);
mediandata(8)=round(iqr(minimum3),1);
mediandata(10)=round(iqr(minimum4),1);
mediandata(12)=round(iqr(minimum34),1);
mediandata(14)=round(iqr(minimum5),1);
mediandata(16)=round(iqr(minimum6),1);
mediandata(18)=round(iqr(minimum56),1);

mediandata2=zeros(1,18);
mediandata2(1)=round(median(diff1),1);
mediandata2(3)=round(median(diff2),1);
mediandata2(5)=round(median(diff12),1);
mediandata2(7)=round(median(diff3),1);
mediandata2(9)=round(median(diff4),1);
mediandata2(11)=round(median(diff34),1);
mediandata2(13)=round(median(diff5),1);
mediandata2(15)=round(median(diff6),1);
mediandata2(17)=round(median(diff56),1);

mediandata2(2)=round(iqr(diff1),1);
mediandata2(4)=round(iqr(diff2),1);
mediandata2(6)=round(iqr(diff12),1);
mediandata2(8)=round(iqr(diff3),1);
mediandata2(10)=round(iqr(diff4),1);
mediandata2(12)=round(iqr(diff34),1);
mediandata2(14)=round(iqr(diff5),1);
mediandata2(16)=round(iqr(diff6),1);
mediandata2(18)=round(iqr(diff56),1);



