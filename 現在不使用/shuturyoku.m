clear all
close all

% none_bottomup=zeros(1,50);
% zero_bottomup=zeros(1,50);
% zero_bottomup=zeros(1,50);
%
% save('subC_integrated','none_bottomup','zero_bottomup','zero_bottomup')

dir = ('F:\実験データ\本実験\subC\subC(ERD推移等)'); %フォルダ識別
data_mat = 'subC_cal';
load([dir,'\',data_mat]);  %フォルダ識別

dir = ('F:\実験データ\本実験\subC\subC(ERD推移等)');
data_mat = 'subC_integrated';
load([dir,'\',data_mat]); %データ読み取り

[a1,a2]=size(none_bottomup);
[b1,b2]=size(zero_bottomup);
[c1,c2]=size(zero_bottomup);
% [d1,d2]=size(none_topdown);
% [e1,e2]=size(zero_topdown);
% [f1,f2]=size(zero_topdown);

for i=1:a2
    for a=1:a1
        if none_bottomup(a,i)==0
            none_bottomup(a,i)=NaN;
        end
    end
    for b=1:b1
        if zero_bottomup(b,i)==0
            zero_bottomup(b,i)=NaN;
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
    %         if zero_topdown(e,i)==0
    %             zero_topdown(e,i)=NaN;
    %         end
    %     end
    %     for f=1:f1
    %         if zero_topdown(f,i)==0
    %             zero_topdown(f,i)=NaN;
    %         end
    %     end
end

zero_inverse=zero_bottomup(26,6:26);
x=0:100:2000;
figure
plot(x,zero_inverse,'LineWidth',2);
xlim([0 2000])
ylim([-100 100])
set(gca,'YTick',-100:25:100);
xlabel('Time [ms]','FontSize',14)
ylabel('ERD,%','FontSize',14)
set(gca,'FontSize',14)
line([0 2000],[JumpTh JumpTh],'color',[0 .3 0],'LineWidth',1,'Linestyle','--');
line([0 2000],[0 0],'color','k','LineWidth',1,'Linestyle','-');

figure
plot(x,zero_inverse-JumpTh,'LineWidth',2);
xlim([0 2000])
ylim([-100 100])
set(gca,'YTick',-100:25:100);
xlabel('Time [ms]','FontSize',14)
ylabel('ERD,%','FontSize',14)
set(gca,'FontSize',14)
line([0 2000],[0 0],'color','k','LineWidth',1,'Linestyle','-');