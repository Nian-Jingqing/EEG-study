clear all
close all

dir = ('J:\実験データ\本実験\subL\subL(ERD推移等)'); %フォルダ識別
data_mat = 'subL_cal';
load([dir,'\',data_mat]);  %フォルダ識別

dir = ('J:\実験データ\本実験\subL\subL(ERD推移等)');
data_mat = 'subL_integrated';
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
            m=zeros(1,1);
            mm=1;
            n=ones(1,1);
            nn=2;
            amount=zeros(1,1);
            am=1;
            for i=1:20
                if none_inverse(i)-JumpTh>0&&none_inverse(i+1)-JumpTh<0
                    m(mm)=i;
                    mm=mm+1;
                elseif none_inverse(i)-JumpTh<0&&none_inverse(i+1)-JumpTh>0
                    n(nn)=i;
                    nn=nn+1;
                end
            end
            if mm-1~=0
                for j=1:nn-1
                    if j>mm-1
                        amount(am)=trapz(x(n(j):end),none_inverse(n(j):end)-JumpTh);
                    else
                        if m(j)==1
                            amount(am)=0;
                        else
                            amount(am)=trapz(x(n(j):m(j)),none_inverse(n(j):m(j))-JumpTh);
                        end
                    end
                    am=am+1;
                end
                Area_n2(An2)=sum(amount);
                An2=An2+1;
            else
                Area_n2(An2)=trapz(x,none_inverse-JumpTh);
                An2=An2+1;
            end
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
        title('subL ジャンプなし条件 後半','FontSize',14)
    else
        subplot(2,3,1)
        none_inverse=none_bottomup(a,6:26);
        if isnan(none_inverse(21))==0
            plot(x,none_inverse-JumpTh);
            m=zeros(1,1);
            mm=1;
            n=ones(1,1);
            nn=2;
            amount=zeros(1,1);
            am=1;
            for i=1:20
                if none_inverse(i)-JumpTh>0&&none_inverse(i+1)-JumpTh<0
                    m(mm)=i;
                    mm=mm+1;
                elseif none_inverse(i)-JumpTh<0&&none_inverse(i+1)-JumpTh>0
                    n(nn)=i;
                    nn=nn+1;
                end
            end
            if mm-1~=0
                for j=1:nn-1
                    if j>mm-1
                        amount(am)=trapz(x(n(j):end),none_inverse(n(j):end)-JumpTh);
                    else
                        if m(j)==1
                            amount(am)=0;
                        else
                            amount(am)=trapz(x(n(j):m(j)),none_inverse(n(j):m(j))-JumpTh);
                        end
                    end
                    am=am+1;
                end
                Area_n1(An1)=sum(amount);
                An1=An1+1;
            else
                Area_n1(An1)=trapz(x,none_inverse-JumpTh);
                An1=An1+1;
            end
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
        title('subL ジャンプなし条件 前半','FontSize',14)
    end
end

for b=1:b1
    if b>bhalf
        subplot(2,3,5)
        half_inverse=half_bottomup(b,6:26);
        if isnan(half_inverse(21))==0
            plot(x,half_inverse-JumpTh);
            m=zeros(1,1);
            mm=1;
            n=ones(1,1);
            nn=2;
            amount=zeros(1,1);
            am=1;
            for i=1:20
                if half_inverse(i)-JumpTh>0&&half_inverse(i+1)-JumpTh<0
                    m(mm)=i;
                    mm=mm+1;
                elseif half_inverse(i)-JumpTh<0&&half_inverse(i+1)-JumpTh>0
                    n(nn)=i;
                    nn=nn+1;
                end
            end
            if mm-1~=0
                for j=1:nn-1
                    if j>mm-1
                        amount(am)=trapz(x(n(j):end),half_inverse(n(j):end)-JumpTh);
                    else
                        if m(j)==1
                            amount(am)=0;
                        else
                            amount(am)=trapz(x(n(j):m(j)),half_inverse(n(j):m(j))-JumpTh);
                        end
                    end
                    am=am+1;
                end
                Area_h2(Ah2)=sum(amount);
                Ah2=Ah2+1;
            else
                Area_h2(Ah2)=trapz(x,half_inverse-JumpTh);
                Ah2=Ah2+1;
            end
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
        title('subL 小ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,2)
        half_inverse=half_bottomup(b,6:26);
        if isnan(half_inverse(21))==0
            plot(x,half_inverse-JumpTh);
            m=zeros(1,1);
            mm=1;
            n=ones(1,1);
            nn=2;
            amount=zeros(1,1);
            am=1;
            for i=1:20
                if half_inverse(i)-JumpTh>0&&half_inverse(i+1)-JumpTh<0
                    m(mm)=i;
                    mm=mm+1;
                elseif half_inverse(i)-JumpTh<0&&half_inverse(i+1)-JumpTh>0
                    n(nn)=i;
                    nn=nn+1;
                end
            end
            if mm-1~=0
                for j=1:nn-1
                    if j>mm-1
                        amount(am)=trapz(x(n(j):end),half_inverse(n(j):end)-JumpTh);
                    else
                        if m(j)==1
                            amount(am)=0;
                        else
                            amount(am)=trapz(x(n(j):m(j)),half_inverse(n(j):m(j))-JumpTh);
                        end
                    end
                    am=am+1;
                end
                Area_h1(Ah1)=sum(amount);
                Ah1=Ah1+1;
            else
                Area_h1(Ah1)=trapz(x,half_inverse-JumpTh);
                Ah1=Ah1+1;
            end
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
        title('subL 小ジャンプ条件 前半','FontSize',14)
    end
end

for c=1:c1
    if c>chalf
        subplot(2,3,6)
        zero_inverse=zero_bottomup(c,6:26);
        if isnan(zero_inverse(21))==0
            plot(x,zero_inverse-JumpTh);
            m=zeros(1,1);
            mm=1;
            n=ones(1,1);
            nn=2;
            amount=zeros(1,1);
            am=1;
            for i=1:20
                if zero_inverse(i)-JumpTh>0&&zero_inverse(i+1)-JumpTh<0
                    m(mm)=i;
                    mm=mm+1;
                elseif zero_inverse(i)-JumpTh<0&&zero_inverse(i+1)-JumpTh>0
                    n(nn)=i;
                    nn=nn+1;
                end
            end
            if mm-1~=0
                for j=1:nn-1
                    if j>mm-1
                        amount(am)=trapz(x(n(j):end),zero_inverse(n(j):end)-JumpTh);
                    else
                        if m(j)==1
                            amount(am)=0;
                        else
                            amount(am)=trapz(x(n(j):m(j)),zero_inverse(n(j):m(j))-JumpTh);
                        end
                    end
                    am=am+1;
                end
                Area_z2(Az2)=sum(amount);
                Az2=Az2+1;
            else
                Area_z2(Az2)=trapz(x,zero_inverse-JumpTh);
                Az2=Az2+1;
            end
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
        title('subL 大ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,3)
        zero_inverse=zero_bottomup(c,6:26);
        if isnan(zero_inverse(21))==0
            plot(x,zero_inverse-JumpTh);
            m=zeros(1,1);
            mm=1;
            n=ones(1,1);
            nn=2;
            amount=zeros(1,1);
            am=1;
            for i=1:20
                if zero_inverse(i)-JumpTh>0&&zero_inverse(i+1)-JumpTh<0
                    m(mm)=i;
                    mm=mm+1;
                elseif zero_inverse(i)-JumpTh<0&&zero_inverse(i+1)-JumpTh>0
                    n(nn)=i;
                    nn=nn+1;
                end
            end
            if mm-1~=0
                for j=1:nn-1
                    if j>mm-1
                        amount(am)=trapz(x(n(j):end),zero_inverse(n(j):end)-JumpTh);
                    else
                        if m(j)==1
                            amount(am)=0;
                        else
                            amount(am)=trapz(x(n(j):m(j)),zero_inverse(n(j):m(j))-JumpTh);
                        end
                    end
                    am=am+1;
                end
                Area_z1(Az1)=sum(amount);
                Az1=Az1+1;
            else
                Area_z1(Az1)=trapz(x,zero_inverse-JumpTh);
                Az1=Az1+1;
            end
        end
        hold on
        grid on
        grid minor
        xlim([0 2000])
        ylim([-150 70])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'FontSize',14)
        %         line([6 6],[-100 100],'color','r','LineWidth',1,'Linestyle','-');
        %         line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        line([0 5000],[0 0],'color','k','LineWidth',2,'Linestyle','-');
        title('subL 大ジャンプ条件 前半','FontSize',14)
    end
end

save('subL_areaPlus','Area_n1','Area_n2','Area_h1','Area_h2','Area_z1','Area_z2')
