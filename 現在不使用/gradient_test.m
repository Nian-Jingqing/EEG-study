clear all
close all

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_gradient2';
load([dir,'\',data_mat]); %データ読み取り

Gradient_hall=[Gradient_h1 Gradient_h2];
Gradient_zall=[Gradient_z1 Gradient_z2];

M1=mean(Gradient_h1);
M2=mean(Gradient_z1);
M3=mean(Gradient_h2);
M4=mean(Gradient_z2);
M5=mean(Gradient_hall);
M6=mean(Gradient_zall);
sd1=std(Gradient_h1);
sd2=std(Gradient_z1);
sd3=std(Gradient_h2);
sd4=std(Gradient_z2);
sd5=std(Gradient_hall);
sd6=std(Gradient_zall);

CV1=sd1/M1;
CV2=sd2/M2;
CV3=sd3/M3;
CV4=sd4/M4;
CV5=sd5/M5;
CV6=sd6/M6;

CV=[CV1,CV2,CV3,CV4,CV5,CV6];


figure
subplot(2,3,1)
plot(1,Gradient_h1,'o')
hold on
plot(2,Gradient_z1,'o')
xlim([0 3])
ylim([-0.1 0.3])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',14)
ylabel('Gradient')
title('subM 先鋭化解析')
[p1,h1]=ranksum(Gradient_h1,Gradient_z1);
[fp1,fh1]=vartest2(Gradient_h1,Gradient_z1);

subplot(2,3,2)
plot(1,Gradient_h2,'o')
hold on
plot(2,Gradient_z2,'o')
xlim([0 3])
ylim([-0.1 0.3])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',14)
ylabel('Gradient')
title('subM 先鋭化解析')
[p2,h2]=ranksum(Gradient_h2,Gradient_z2);
[fp2,fh2]=vartest2(Gradient_h2,Gradient_z2);

subplot(2,3,3)
plot(1,Gradient_h1,'o')
hold on
plot(2,Gradient_h2,'o')
xlim([0 3])
ylim([-0.1 0.3])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','小ジャンプ後半'}));
set(gca,'FontSize',14)
ylabel('Gradient')
title('subM 先鋭化解析')
[p3,h3]=ranksum(Gradient_h1,Gradient_h2);
[fp3,fh3]=vartest2(Gradient_h1,Gradient_h2);

subplot(2,3,4)
plot(1,Gradient_z1,'o')
hold on
plot(2,Gradient_z2,'o')
xlim([0 3])
ylim([-0.1 0.3])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'大ジャンプ前半','大ジャンプ後半'}));
set(gca,'FontSize',14)
ylabel('Gradient')
title('subM 先鋭化解析')
[p4,h4]=ranksum(Gradient_z1,Gradient_z2);
[fp4,fh4]=vartest2(Gradient_z1,Gradient_z2);

subplot(2,3,5)
plot(1,Gradient_hall,'o')
hold on
plot(2,Gradient_zall,'o')
xlim([0 3])
ylim([-0.1 0.3])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',14)
ylabel('Gradient')
title('subM 先鋭化解析')
[p5,h5]=ranksum(Gradient_hall,Gradient_zall);
[fp5,fh5]=vartest2(Gradient_hall,Gradient_zall);
