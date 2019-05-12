clear all
% close all

% none_bottomup=zeros(1,50);
% half_bottomup=zeros(1,50);
% zero_bottomup=zeros(1,50);
%
% save('subC_integrated','none_bottomup','half_bottomup','zero_bottomup')

dir = ('F:\実験データ\本実験\subC\subC(ERD推移等)'); %フォルダ識別
data_mat = 'subC_cal';
load([dir,'\',data_mat]);  %フォルダ識別

dir = ('F:\実験データ\本実験\subC\subC(ERD推移等)');
data_mat = 'subC_integrated';
load([dir,'\',data_mat]); %データ読み取り

[a1,a2]=size(none_bottomup);
[b1,b2]=size(half_bottomup);
[c1,c2]=size(zero_bottomup);
% [d1,d2]=size(none_topdown);
% [e1,e2]=size(half_topdown);
% [f1,f2]=size(zero_topdown);

for i=1:a2
    for a=1:a1
        if none_bottomup(a,i)==0
            none_bottomup(a,i)=NaN;
        end
    end
    for b=1:b1
        if half_bottomup(b,i)==0
            half_bottomup(b,i)=NaN;
        end
    end
    for c=1:c1
        if zero_bottomup(c,i)==0
            zero_bottomup(c,i)=NaN;
        end
    end
    %     for d=1:d1
    %         if none_topdown(d,i)==0
    %             none_topdown(d,i)=NaN;
    %         end
    %     end
    %     for e=1:e1
    %         if half_topdown(e,i)==0
    %             half_topdown(e,i)=NaN;
    %         end
    %     end
    %     for f=1:f1
    %         if zero_topdown(f,i)==0
    %             zero_topdown(f,i)=NaN;
    %         end
    %     end
end
minimum1=zeros(1,1);
diff1=zeros(1,1);
minimum2=zeros(1,1);
diff2=zeros(1,1);
minimum3=zeros(1,1);
diff3=zeros(1,1);
minimum4=zeros(1,1);
diff4=zeros(1,1);
minimum5=zeros(1,1);
diff5=zeros(1,1);
minimum6=zeros(1,1);
diff6=zeros(1,1);
% minimum12=zeros(1,1);
% minimum34=zeros(1,1);
% minimum56=zeros(1,1);
mi1=1;
d1=1;
mi2=1;
d2=1;
mi3=1;
d3=1;
mi4=1;
d4=1;
mi5=1;
d5=1;
mi6=1;
d6=1;
% m12=1;
% m34=1;
% m56=1;
figure
for a=1:a1
    if a>ahalf
        subplot(2,3,4)
        %         p2=plot(none_bottomup(a,:),'m');
        none_inverse=none_bottomup(a,:);
        [npks2,nlocs2]=findpeaks(-none_inverse(5:end));
        [ppks2,plocs2]=findpeaks(none_inverse(5:end));
        [npks4,nlocs4]=findpeaks(none_inverse);
        x=1:1:50;
        y=none_inverse;
        plot(x,y)
        hold on
        grid on
        if isempty(nlocs2)~=1
            minimum2(mi2,1)=(nlocs2(1)-2)*100;
            mi2=mi2+1;
            if size(ppks2,2)>1
                diff2(d2,1)=npks2(1)+ppks2(2);
                d2=d2+1;
            end
        end
        xlim([1 50])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;6;16;26;36;46]));
        set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('ジャンプなし条件 後半','FontSize',14)
    else
        subplot(2,3,1)
                p1=plot(none_bottomup(a,:),'c');
        none_inverse=none_bottomup(a,:);
        [npks1,nlocs1]=findpeaks(-none_inverse(5:end));
        [ppks1,plocs1]=findpeaks(none_inverse(5:end));
        [npks3,nlocs3]=findpeaks(none_inverse);
        x=1:1:50;
        y=none_inverse;
        plot(x,y)
        hold on
        grid on
        if isempty(nlocs1)~=1
            minimum1(mi1,1)=(nlocs1(1)-2)*100;
            mi1=mi1+1;
            if size(ppks1,2)>1
                diff1(d1,1)=npks1(1)+ppks1(2);
                d1=d1+1;
            end
        end
        xlim([1 50])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;6;16;26;36;46]));
        set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('ジャンプなし条件 前半','FontSize',14)
    end
end

% legend([p1,p2],'1~5','6~10','Location','southeast')

for b=1:b1
    if b>bhalf
        subplot(2,3,5)
        %         p2=plot(half_bottomup(b,:),'m');
        half_inverse=half_bottomup(b,:);
        [npks2,nlocs2]=findpeaks(-half_inverse(5:end));
        [ppks2,plocs2]=findpeaks(half_inverse(5:end));
        [npks4,nlocs4]=findpeaks(half_inverse);
        x=1:1:50;
        y=half_inverse;
        plot(x,y)
        hold on
        grid on
        if isempty(nlocs2)~=1
            minimum4(mi4,1)=(nlocs2(1)-2)*100;
            mi4=mi4+1;
            if size(ppks2,2)>1
                diff4(d4,1)=npks2(1)+ppks2(2);
                d4=d4+1;
            end
        end
        xlim([1 50])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;6;16;26;36;46]));
        set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('小ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,2)
                p1=plot(half_bottomup(b,:),'c');
        half_inverse=half_bottomup(b,:);
        [npks1,nlocs1]=findpeaks(-half_inverse(5:end));
        [ppks1,plocs1]=findpeaks(half_inverse(5:end));
        [npks3,nlocs3]=findpeaks(half_inverse);
        x=1:1:50;
        y=half_inverse;
        plot(x,y,'LineWidth',1)
        hold on
        grid on
        if isempty(nlocs1)~=1
            minimum3(mi3,1)=(nlocs1(1)-2)*100;
            mi3=mi3+1;
            if size(ppks1,2)>1
                diff3(d3,1)=npks1(1)+ppks1(2);
                d3=d3+1;
            end
        end
        xlim([1 50])
        ylim([-100 100])
        set(gca,'YTick',-100:25:100);
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD,%','FontSize',14)
        set(gca,'XTick',([1;6;16;26;36;46]));
        set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([6 6],[-100 100],'color','r','LineWidth',2,'Linestyle','-');
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',2,'Linestyle','-');
        line([0 50],[JumpTh JumpTh],'color',[0 .3 0],'LineWidth',2,'Linestyle','-');
        title('小ジャンプ条件','FontSize',14)
    end
end
% legend([p1,p2],'1~5','6~10','Location','southeast')

for c=1:c1
    if c>chalf
        subplot(2,3,6)
        %         p2=plot(zero_bottomup(c,:),'m');
        zero_inverse=zero_bottomup(c,:);
        [npks2,nlocs2]=findpeaks(-zero_inverse(5:end));
        [ppks2,plocs2]=findpeaks(zero_inverse(5:end));
        [npks4,nlocs4]=findpeaks(zero_inverse);
        x=1:1:50;
        y=zero_inverse;
        plot(x,y)
        hold on
        grid on
        if isempty(nlocs2)~=1
            minimum6(mi6,1)=(nlocs2(1)-2)*100;
            mi6=mi6+1;
            if size(ppks2,2)>1
                diff6(d6,1)=npks2(1)+ppks2(2);
                d6=d6+1;
            end
        end
        xlim([1 50])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;6;16;26;36;46]));
        set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('大ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,3)
                p1=plot(zero_bottomup(c,:),'c');
        zero_inverse=zero_bottomup(c,:);
        [npks1,nlocs1]=findpeaks(-zero_inverse(5:end));
        [ppks1,plocs1]=findpeaks(zero_inverse(5:end));
        [npks3,nlocs3]=findpeaks(zero_inverse);
        x=1:1:50;
        y=zero_inverse;
        plot(x,y,'LineWidth',1)
        
        hold on
        grid on
        if isempty(nlocs1)~=1
            minimum5(mi5,1)=(nlocs1(1)-2)*100;
            mi5=mi5+1;
            if size(ppks1,2)>1
                diff5(d5,1)=npks1(1)+ppks1(2);
                d5=d5+1;
            end
        end
        xlim([1 50])
        ylim([-100 100])
        set(gca,'YTick',-100:25:100);
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD,%','FontSize',14)
        set(gca,'XTick',([1;6;16;26;36;46]));
        set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([6 6],[-100 100],'color','r','LineWidth',2,'Linestyle','-');
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',2,'Linestyle','-');
        line([0 50],[JumpTh JumpTh],'color',[0 .3 0],'LineWidth',2,'Linestyle','-');
        title('大ジャンプ条件','FontSize',14)
    end
end
% legend([p1,p2],'1~5','6~10','Location','southeast')

% diff1=sort(diff1);
% diff2=sort(diff2);
% diff3=sort(diff3);
% diff4=sort(diff4);
% diff5=sort(diff5);
% diff6=sort(diff6);
% minimum1=sort(minimum1);
% minimum2=sort(minimum2);
% minimum3=sort(minimum3);
% minimum4=sort(minimum4);
% minimum5=sort(minimum5);
% minimum6=sort(minimum6);%←ここまで目視除去前
% 
% diff1(find(~diff1))=[];
% diff2(find(~diff2))=[];
% diff3(find(~diff3))=[];
% diff4(find(~diff4))=[];
% diff5(find(~diff5))=[];
% diff6(find(~diff6))=[];
% minimum1(find(~minimum1))=[];
% minimum2(find(~minimum2))=[];
% minimum3(find(~minimum3))=[];
% minimum4(find(~minimum4))=[];
% minimum5(find(~minimum5))=[];
% minimum6(find(~minimum6))=[];
% 
% [u1,u2]=size(diff1);
% [u3,u4]=size(diff2);
% [v1,v2]=size(diff3);
% [v3,v4]=size(diff4);
% [w1,w2]=size(diff5);
% [w3,w4]=size(diff6);
% [x1,x2]=size(minimum1);
% [x3,x4]=size(minimum2);
% [y1,y2]=size(minimum3);
% [y3,y4]=size(minimum4);
% [z1,z2]=size(minimum5);
% [z3,z4]=size(minimum6);
% 
% diff12=diff1;
% diff34=diff3;
% diff56=diff5;
% minimum12=minimum1;
% minimum34=minimum3;
% minimum56=minimum5;
% 
% diff12(u1+1:u1+u3)=diff2;
% diff34(v1+1:v1+v3)=diff4;
% diff56(w1+1:w1+w3)=diff6;
% minimum12(x1+1:x1+x3)=minimum2;
% minimum34(y1+1:y1+y3)=minimum4;
% minimum56(z1+1:z1+z3)=minimum6;


% save('subC_hist','minimum1','minimum2','minimum3','minimum4','minimum5','minimum6','minimum12','minimum34','minimum56','diff1','diff2','diff3','diff4','diff5','diff6','diff12','diff34','diff56');

% for d=1:d1
%     subplot(2,3,4)
%     if d>9
%         p2=plot(none_topdown(d,:),'m');
%     else
%         p1=plot(none_topdown(d,:),'c');
%     end
%     hold on
%     grid on
%     xlim([1 50])
%     ylim([-100 100])
%     xlabel('Time [ms]','FontSize',14)
%     ylabel('ERD,%')
%     xticks([3,8,13,18,23,28,33,38,43,48]);
%     xticklabels({'-500','0','1000','2000','3000','4000'});
%     line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
%     line([0 50],[-ERDGoal -ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
%     title('subC ジャンプなし条件 topdown');
% end
%     legend([p1,p2],'1~5','6~10','Location','southeast');
% for e=1:e1
%     subplot(2,3,5)
%     if e>9
%         p2=plot(half_topdown(e,:),'m');
%     else
%         p1=plot(half_topdown(e,:),'c');
%     end
%     hold on
%     grid on
%     xlim([1 50])
%     ylim([-100 100])
%     xlabel('Time [ms]','FontSize',14)
%     ylabel('ERD,%')
%     xticks([3,8,13,18,23,28,33,38,43,48]);
%     xticklabels({'-500','0','1000','2000','3000','4000'});
%     line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
%     line([0 50],[-ERDGoal -ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
%     title('subC 小ジャンプ条件 topdown')
% end
%     legend([p1,p2],'1~5','6~10','Location','southeast')
% for f=1:f1
%     subplot(2,3,6)
%     if f>9
%         p2=plot(zero_topdown(f,:),'m');
%     else
%         p1=plot(zero_topdown(f,:),'c');
%     end
%     hold on
%     grid on
%     xlim([1 50])
%     ylim([-100 100])
%     xlabel('Time [ms]','FontSize',14)
%     ylabel('ERD,%')
%     xticks([3,8,13,18,23,28,33,38,43,48]);
%     xticklabels({'-500','0','1000','2000','3000','4000'});
%     line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
%     line([0 50],[-ERDGoal -ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
%     title('subC 大ジャンプ条件 topdown')
% end
%     legend([p1,p2],'1~5','6~10','Location','southeast')

