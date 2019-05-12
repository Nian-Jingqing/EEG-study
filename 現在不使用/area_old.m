clear all
close all

dir = ('J:\実験データ\本実験\subI\subI(ERD推移等)'); %フォルダ識別
data_mat = 'subI_cal';
load([dir,'\',data_mat]);  %フォルダ識別

dir = ('J:\実験データ\本実験\subI\subI(ERD推移等)');
data_mat = 'subI_integrated';
load([dir,'\',data_mat]); %データ読み取り

[a1,a2]=size(none_bottomup);
[b1,b2]=size(half_bottomup);
[c1,c2]=size(zero_bottomup);

Area_n1=zeros(1,1);
Area_n2=zeros(1,1);
Area_h1=zeros(1,1);
Area_h2=zeros(1,1);
Area_z1=zeros(1,1);
Area_z2=zeros(1,1);
An1=1;
An2=1;
Ah1=1;
Ah2=1;
Az1=1;
Az2=1;

x=0:100:2000;
for i=1:50
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
end

for a=1:a1
    if a>ahalf
        subplot(2,3,4)
        none_inverse=none_bottomup(a,6:26);
        if isnan(none_inverse(21))==0
            plot(x,none_inverse-JumpTh);
            Area_n2(An2)=trapz(x,none_inverse-JumpTh);
            An2=An2+1;
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        %         set(gca,'XTick',([1;6;16;26;36;46]));
        %         set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subI ジャンプなし条件 後半','FontSize',14)
    else
        subplot(2,3,1)
        none_inverse=none_bottomup(a,6:26);
        if isnan(none_inverse(21))==0
            plot(x,none_inverse-JumpTh);
            Area_n1(An1)=trapz(x,none_inverse-JumpTh);
            An1=An1+1;
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        %         set(gca,'XTick',([1;6;16;26;36;46]));
        %         set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subI ジャンプなし条件 前半','FontSize',14)
    end
end

for b=1:b1
    if b>bhalf
        subplot(2,3,5)
        half_inverse=half_bottomup(b,6:26);
        if isnan(half_inverse(21))==0
            plot(x,half_inverse-JumpTh);
            Area_h2(Ah2)=trapz(x,half_inverse-JumpTh);
            Ah2=Ah2+1;
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        %         set(gca,'XTick',([1;6;16;26;36;46]));
        %         set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subI 小ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,2)
        half_inverse=half_bottomup(b,6:26);
        if isnan(half_inverse(21))==0
            plot(x,half_inverse-JumpTh);
            Area_h1(Ah1)=trapz(x,half_inverse-JumpTh);
            Ah1=Ah1+1;
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        %         set(gca,'XTick',([1;6;16;26;36;46]));
        %         set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subI 小ジャンプ条件 前半','FontSize',14)
    end
end

for c=1:c1
    if c>chalf
        subplot(2,3,6)
        zero_inverse=zero_bottomup(c,6:26);
        if isnan(zero_inverse(21))==0
            plot(x,zero_inverse-JumpTh);
            Area_z2(Az2)=trapz(x,zero_inverse-JumpTh);
            Az2=Az2+1;
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        %         set(gca,'XTick',([1;6;16;26;36;46]));
        %         set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subI 大ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,3)
        zero_inverse=zero_bottomup(c,6:26);
        if isnan(zero_inverse(21))==0
            plot(x,zero_inverse-JumpTh);
            Area_z1(Az1)=trapz(zero_inverse-JumpTh);
            Az1=Az1+1;
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        %         set(gca,'XTick',([1;6;16;26;36;46]));
        %         set(gca,'XTickLabel',({'-500','0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subI 大ジャンプ条件 前半','FontSize',14)
    end
end

% save('subI_area2','Area_n1','Area_n2','Area_h1','Area_h2','Area_z1','Area_z2')