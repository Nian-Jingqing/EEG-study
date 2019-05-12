clear all
% close all

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)'); %フォルダ識別
data_mat = 'subM_cal';
load([dir,'\',data_mat]);  %フォルダ識別

dir = ('F:\実験データ\本実験\subM\subM(ERD推移等)');
data_mat = 'subM_integrated';
load([dir,'\',data_mat]); %データ読み取り

[a1,a2]=size(none_bottomup);
[b1,b2]=size(half_bottomup);
[c1,c2]=size(zero_bottomup);

Gradient_n1=zeros(1,1);
Gradient_n2=zeros(1,1);
Gradient_h1=zeros(1,1);
Gradient_h2=zeros(1,1);
Gradient_z1=zeros(1,1);
Gradient_z2=zeros(1,1);
Gn1=1;
Gn2=1;
Gh1=1;
Gh2=1;
Gz1=1;
Gz2=1;

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

figure
for a=1:a1
    if a>ahalf
        subplot(2,3,4)
        none_inverse=none_bottomup(a,:);
        if none_inverse(6)<none_inverse(7)
            plot(none_inverse(6:end));
            hold on
            plot(2,none_inverse(7),'ro');
            plot(1,none_inverse(6),'ko');
            Gradient_n2(Gn2)=(none_inverse(7)-none_inverse(6))/100;
            Gn2=Gn2+1;
        end
        hold on
        grid on
        grid minor
        xlim([1 11])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('subM ジャンプなし条件 後半','FontSize',14)
    else
        subplot(2,3,1)
        none_inverse=none_bottomup(a,:);
        if none_inverse(6)<none_inverse(7)
            plot(none_inverse(6:end));
            hold on
            plot(2,none_inverse(7),'ro');
            plot(1,none_inverse(6),'ko');
            Gradient_n1(Gn1)=(none_inverse(7)-none_inverse(6))/100;
            Gn1=Gn1+1;
        end
        hold on
        grid on
        grid minor
        xlim([1 11])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('subM ジャンプなし条件 前半','FontSize',14)
    end
end

for b=1:b1
    if b>bhalf
        subplot(2,3,5)
        half_inverse=half_bottomup(b,:);
        if half_inverse(6)<half_inverse(7)
            plot(half_inverse(6:end));
            hold on
            plot(2,half_inverse(7),'ro');
            plot(1,half_inverse(6),'ko');
            Gradient_h2(Gh2)=(half_inverse(7)-half_inverse(6))/100;
            Gh2=Gh2+1;
        end
        hold on
        grid on
        grid minor
        xlim([1 11])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('subM 小ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,2)
        half_inverse=half_bottomup(b,:);
        if half_inverse(6)<half_inverse(7)
            plot(half_inverse(6:end));
            hold on
            plot(2,half_inverse(7),'ro');
            plot(1,half_inverse(6),'ko');
            Gradient_h1(Gh1)=(half_inverse(7)-half_inverse(6))/100;
            Gh1=Gh1+1;
        end
        hold on
        grid on
        grid minor
        xlim([1 11])
        ylim([-100 100])
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('subM 小ジャンプ条件 前半','FontSize',14)
    end
end

for c=1:c1
    if c>chalf
        subplot(2,3,6)
        zero_inverse=zero_bottomup(c,:);
        if zero_inverse(6)<zero_inverse(7)
            plot(zero_inverse(6:end));
            hold on
            plot(2,zero_inverse(7),'ro');
            plot(1,zero_inverse(6),'ko');
            Gradient_z2(Gz2)=(zero_inverse(7)-zero_inverse(6))/100;
            Gz2=Gz2+1;
        end
        hold on
        grid on
        grid minor
        xlim([1 11])
        ylim([-100 100])
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'FontSize',14)
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('subM 大ジャンプ条件 後半','FontSize',14)
    else
        subplot(2,3,3)
        zero_inverse=zero_bottomup(c,:);
        if zero_inverse(6)<zero_inverse(7)
            plot(zero_inverse(6:end));
            hold on
            plot(2,zero_inverse(7),'ro');
            plot(1,zero_inverse(6),'ko');
            Gradient_z1(Gz1)=(zero_inverse(7)-zero_inverse(6))/100;
            Gz1=Gz1+1;
        end
        hold on
        grid on
        grid minor
        xlim([1 11])
        ylim([-100 100])
        xlabel('Time [ms]','FontSize',14)
        ylabel('ERD/ERS,%','FontSize',14)
        set(gca,'XTick',([1;11;21;31;41]));
        set(gca,'XTickLabel',({'0','1000','2000','3000','4000'}));
        set(gca,'FontSize',14)
        line([0 50],[ERDGoal ERDGoal],'color','b','LineWidth',1,'Linestyle','-');
        title('subM 大ジャンプ条件 前半','FontSize',14)
    end
end

% save('subM_Gradient2','Gradient_n1','Gradient_n2','Gradient_h1','Gradient_h2','Gradient_z1','Gradient_z2')
