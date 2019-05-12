clear all
close all

% dir = ('J:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
% data_mat = 'subA_cal';
% load([dir,'\',data_mat]); %データ読み取り

dir = ('J:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_1';
load([dir,'\',data_mat]); %データ読み取り
kfind=zeros(20,1);
ERDThData=zeros(2,50);
o=1;
r(2,:)=1;
for i=1:20
    for j=1:50
        if ERDData(i,j)==0
            ERDData(i,j)=NaN;
        end
    end
    k=find(JumpTime(i,:));
    if isempty(k)==1
        kfind(i)=0;
    else
        kfind(i)=k;
    end
    if kfind(i)~=0
        ERDThData(o,:)=ERDData(i,:);
        o=o+1;
    else
        r(2,i)=0;
    end
end

s=find(r(2,:)==0);
r(:,s)=[];
r=r(1,:);

judgesat=ones(o-1,1);
kfind(kfind==0)=NaN;
kfind=kfind(~isnan(kfind));
for i=1:o-1
    for j=1:50
        if ERDThData(i,j)>99
            kfind(i)=0;
            judgesat(i)=0;
        end
    end
end
kfind(kfind>39)=0;
r(find(~kfind))=[];
ERDThData(find(~kfind),:)=[];
kfind(kfind==0)=NaN;
kfind=kfind(~isnan(kfind));

[p1,p2]=size(kfind);%ここまででジャンプ閾値をまたいでないもの、10s以降にジャンプしたもの、サチレーションしたものを除去できている

bottomup=zeros(1,50);%下から上に跨いだもの
kfindb=zeros(1,1);
rb=zeros(1,1);
topdown=zeros(1,50); %上から下に跨いだもの
kfindt=zeros(1,1);
rt=zeros(1,1);
b=1;
t=1;

none_bottomup=zeros(1,50);
half_bottomup=zeros(1,50);
zero_bottomup=zeros(1,50);
none_topdown=zeros(1,50);
half_topdown=zeros(1,50);
zero_topdown=zeros(1,50);
n_b=1;
h_b=1;
z_b=1;
n_t=1;
h_t=1;
z_t=1;


for i=1:p1
    if ERDThData(i,kfind(i))>ERDThData(i,kfind(i)-1)
        bottomup(b,:)=ERDThData(i,:);
        kfindb(b)=kfind(i);
        rb(b)=r(i);
        b=b+1;
    elseif ERDThData(i,kfind(i))<ERDThData(i,kfind(i)-1)
        topdown(t,:)=ERDThData(i,:);
        kfindt(t)=kfind(i);
        rt(t)=r(i);
        t=t+1;
    end
end %ここまでで上から下、下から上を分離

% for i=1:20
%     figure
%     plot(ERDData(i,:))
%     hold on
%     plot(ERDrawData(i,:))
%     grid on
%     xlim([1 50])
%     ylim([-100 100])
%     xlabel('window_num')
%     ylabel('ERD(%)')
% end

for i=1:b-1
    bottomupcut=bottomup(i,kfindb(i)-5:end);
    [b1,b2]=size(bottomupcut);
    if rb(i)>=1&&rb(i)<=10
        none_bottomup(n_b,1:b2)=bottomupcut;
        n_b=n_b+1;
%         figure(1)
%         plot(bottomupcut)
%         hold on
%         grid on
%         line([3 3],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
%         title('jump-none')
    elseif rb(i)>=11&&rb(i)<=15
        half_bottomup(h_b,1:b2)=bottomupcut;
        h_b=h_b+1;
%         figure(2)
%         plot(bottomupcut)
%         hold on
%         grid on
%         line([3 3],[-100 100],'color','b','LineWidth',1,'Linestyle','-');
%         title('jump-to-half');
    elseif rb(i)>=16&&rb(i)<=20
        zero_bottomup(z_b,1:b2)=bottomupcut;
        z_b=z_b+1;
%         figure(3)
%         plot(bottomupcut)
%         hold on
%         grid on
%         line([3 3],[-100 100],'color','g','LineWidth',1,'Linestyle','-');
%         title('jump-to-0%')
    end
%     xlim([1 50])
%     ylim([-100 100])
%     xlabel('window_num')
%     ylabel('ERD(%)')
end
x101010=none_bottomup;
y101010=half_bottomup;
z101010=zero_bottomup;

none_bottomup=[x111;x222;x333;x444;x555;x666;x777;x888;x999;x101010];
half_bottomup=[y111;y222;y333;y444;y555;y666;y777;y888;y999;y101010];
zero_bottomup=[z111;z222;z333;z444;z555;z666;z777;z888;z999;z101010];

save('subA_integrated','none_bottomup','half_bottomup','zero_bottomup')
% for i=1:t-1
%     topdowncut=topdown(i,kfindt(i)-5:end);
%     [t1,t2]=size(topdowncut);
%     if rt(i)>=1&&rt(i)<=10
%         none_topdown(n_t,1:t2)=topdowncut;
%         n_t=n_t+1;
% %         figure(4)
% %         plot(topdowncut)
% %         hold on
% %         grid on
% %         line([3 3],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
% %         title('jump-none')
%     elseif rt(i)>=11&&rt(i)<=15
%         half_topdown(h_t,1:t2)=topdowncut;
%         h_t=h_t+1;
% %         figure(5)
% %         plot(topdowncut)
% %         hold on
% %         grid on
% %         line([3 3],[-100 100],'color','b','LineWidth',1,'Linestyle','-');
% %         title('jump-to-half');
%     elseif rt(i)>=16&&rt(i)<=20
%         zero_topdown(z_t,1:t2)=topdowncut;
%         z_t=z_t+1;
% %         figure(6)
% %         plot(topdowncut)
% %         hold on
% %         grid on
% %         line([3 3],[-100 100],'color','g','LineWidth',1,'Linestyle','-');
% %         title('jump-to-0%')
%     end
% 
% 
% %     xlim([1 50])
% %     ylim([-100 100])
% %     xlabel('window_num')
% %     ylabel('ERD(%)')
% end