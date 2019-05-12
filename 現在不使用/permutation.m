clear all

dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_area3';
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

% figure
% % subplot(1,2,1)
% plot(1,Area_h1,'ko','Markersize',20,'MarkerFaceColor','k','LineWidth',2)
% hold on
% plot(2,Area_z1,'ko','Markersize',20,'MarkerFaceColor','k','LineWidth',2)
% xlim([0 3])
% ylim([-20000 100000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小ジャンプ条件','大ジャンプ条件'}));
% set(gca,'FontSize',35)
% ylabel('ERD response (a.u.)')
% % title('前半')
% Dobs=mean(Area_z1)-mean(Area_h1);
% len=nchoosek(size(Area_h1,2)+size(Area_z1,2),size(Area_h1,2));
% perm=[Area_h1 Area_z1];
% perm1=combnk(perm,size(Area_h1,2));
% pa=zeros(len,size(Area_h1,2));
% pb=zeros(len,size(Area_z1,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% p1=sum(Ds>=Dobs)/len;

% subplot(1,2,2)
% plot(1,Area_h2,'ko','Markersize',10,'LineWidth',2)
% hold on
% plot(2,Area_z2,'ko','Markersize',10,'LineWidth',2)
% xlim([0 3])
% ylim([-20000 200000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'ジャンプ小','ジャンプ大'}));
% set(gca,'FontSize',22)
% ylabel('area [a.u.]')
% title('後半')
% Dobs=mean(Area_z2)-mean(Area_h2);
% len=nchoosek(size(Area_h2,2)+size(Area_z2,2),size(Area_h2,2));
% perm=[Area_h2 Area_z2];
% perm1=combnk(perm,size(Area_h2,2));
% pa=zeros(len,size(Area_h2,2));
% pb=zeros(len,size(Area_z2,2));
% Ds=zeros(1,len);
% for i=1:len
%     pa(i,:)=perm1(i,:);
%     pb(i,:)=setdiff(perm,pa(i,:));
%     Ds(i)=mean(pb(i,:))-mean(pa(i,:));
% end
% p2=sum(Ds>=Dobs)/len;


% subplot(1,3,3)
% plot(1,Area_h1,'ko')
% hold on
% plot(2,Area_h2,'ko')
% xlim([0 3])
% ylim([-20000 200000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'小前半','小後半'}));
% set(gca,'FontSize',13)
% ylabel('area')
% title('subA 浅化解析')
% [p3,h3]=ranksum(Area_h1,Area_h2);
% [fp3,fh]=ttest2(Area_h1,Area_h2);

% subplot(2,3,4)
% plot(1,Area_z1,'ko')
% hold on
% plot(2,Area_z2,'ko')
% xlim([0 3])
% ylim([-20000 200000])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'大前半','大後半'}));
% set(gca,'FontSize',13)
% ylabel('area')
% title('subA 浅化解析')
% [p4,h4]=ranksum(Area_z1,Area_z2);
% [fp4,fh4]=ttest2(Area_z1,Area_z2);

figure
plot(1,-Area_hall,'ko','Markersize',20,'MarkerFaceColor','k','LineWidth',2)
hold on
plot(2,-Area_zall,'ko','Markersize',20,'MarkerFaceColor','k','LineWidth',2)
xlim([0 3])
ylim([-20000 200000])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'小ジャンプ条件','大ジャンプ条件'}));
set(gca,'FontSize',35)
ylabel('ERD response (a.u.)')
% title('前後半')
Dobs=mean(Area_zall)-mean(Area_hall);
len=nchoosek(size(Area_hall,2)+size(Area_zall,2),size(Area_hall,2));
perm=[Area_hall Area_zall];
perm1=combnk(perm,size(Area_hall,2));
pa=zeros(len,size(Area_hall,2));
pb=zeros(len,size(Area_zall,2));
Ds=zeros(1,len);
for i=1:len
    pa(i,:)=perm1(i,:);
    pb(i,:)=setdiff(perm,pa(i,:));
    Ds(i)=mean(pb(i,:))-mean(pa(i,:));
end
p3=sum(Ds>=Dobs)/len;

