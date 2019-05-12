clear all

dir = ('J:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_area3';
load([dir,'\',data_mat]); %データ読み取り

Area_hall=[Area_h1 Area_h2];
Area_zall=[Area_z1 Area_z2];

% M1=mean(Area_h1);
% M2=mean(Area_z1);
% M3=mean(Area_h2);
% M4=mean(Area_z2);
% M5=mean(Area_hall);
% M6=mean(Area_zall);
% sd1=std(Area_h1);
% sd2=std(Area_z1);
% sd3=std(Area_h2);
% sd4=std(Area_z2);
% sd5=std(Area_hall);
% sd6=std(Area_zall);
% 
% CV1=sd1/M1;
% CV2=sd2/M2;
% CV3=sd3/M3;
% CV4=sd4/M4;
% CV5=sd5/M5;
% CV6=sd6/M6;
% 
% CV=[CV1,CV2,CV3,CV4,CV5,CV6];

Area_h1=Area_h1(find(Area_h1));
Area_z1=Area_z1(find(Area_z1));
Area_h2=Area_h2(find(Area_h2));
Area_z2=Area_z2(find(Area_z2));
Area_hall=Area_hall(find(Area_hall));
Area_zall=Area_zall(find(Area_zall));%0を排除

Area_h1=Area_h1(abs(Area_h1-mean(Area_h1))<2*std(Area_h1));
Area_z1=Area_z1(abs(Area_z1-mean(Area_z1))<2*std(Area_z1));
Area_h2=Area_h2(abs(Area_h2-mean(Area_h2))<2*std(Area_h2));
Area_z2=Area_z2(abs(Area_z2-mean(Area_z2))<2*std(Area_z2));
Area_hall=Area_hall(abs(Area_hall-mean(Area_hall))<2*std(Area_hall));
Area_zall=Area_zall(abs(Area_zall-mean(Area_zall))<2*std(Area_zall));



figure
subplot(1,3,1)
plot(1,Area_h1,'o')
hold on
plot(2,Area_z1,'o')
xlim([0 3])
ylim([-200000 200000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ前半','大ジャンプ前半'}));
set(gca,'FontSize',13)
ylabel('area')
title('subM 浅化解析')
[sp1,sh1]=ranksum(Area_h1,Area_z1,'Tail','left');
[th1,tp1]=ttest2(Area_h1,Area_z1,'Tail','left');

subplot(1,3,2)
plot(1,Area_h2,'o')
hold on
plot(2,Area_z2,'o')
xlim([0 3])
ylim([-200000 200000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ後半','大ジャンプ後半'}));
set(gca,'FontSize',13)
ylabel('area')
title('subM 浅化解析')
[sp2,sh2]=ranksum(Area_h2,Area_z2,'Tail','left');
[th2,tp2]=ttest2(Area_h2,Area_z2,'Tail','left');

% subplot(2,3,3)
% plot(1,Area_h1,'o')
% hold on
% plot(2,Area_h2,'o')
% xlim([0 3])
% ylim([-200000 200000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ前半','小ジャンプ後半'}));
% set(gca,'FontSize',13)
% ylabel('area')
% title('subM 浅化解析')
% [p3,h3]=ranksum(Area_h1,Area_h2);
% [fp3,fh]=ttest2(Area_h1,Area_h2);
% 
% subplot(2,3,4)
% plot(1,Area_z1,'o')
% hold on
% plot(2,Area_z2,'o')
% xlim([0 3])
% ylim([-200000 200000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'大ジャンプ前半','大ジャンプ後半'}));
% set(gca,'FontSize',13)
% ylabel('area')
% title('subM 浅化解析')
% [p4,h4]=ranksum(Area_z1,Area_z2);
% [fp4,fh4]=ttest2(Area_z1,Area_z2);

figure
subplot(1,3,3)
plot(1,Area_hall,'o')
hold on
plot(2,Area_zall,'o')
xlim([0 3])
ylim([-200000 200000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ総合','大ジャンプ総合'}));
set(gca,'FontSize',13)
ylabel('area')
title('subM 浅化解析')
[sp3,sh3]=ranksum(Area_hall,Area_zall,'Tail','left');
[th3,tp3]=ttest2(Area_hall,Area_zall,'Tail','left');
