clear all
close all

dir = ('G:\脳波データ(矢上ノイズ除去TF)'); %フォルダ識別
sub_name={'kobayashi','hara','okamoto','nagai','kida','kiriyama','hosoda','fukuoka','fujimoto','nakamura','uehata','yamazaki','iwama','fujimon','fukuda','hirose'};
% sub_name={'nagai','nakamura','fukuoka','kida','hosoda','hara'};
ERD_allsub=zeros(size(sub_name,2),2);
for i=1:size(sub_name,2)
    data_mat = [sub_name{i},'_ERDave'];
    load([dir,'\',data_mat]); %データ読み取り
    ERD_allsub(i,:)=ERD_allave;
end

[h,p]=ttest(ERD_allsub(:,1)-ERD_allsub(:,2));

disp1=figure(1);
plot(ERD_allsub([1,3,6,11,12,13,15],:)','o-','color',[0.6 0.6 0.6],'Linewidth',2)
hold on
plot(ERD_allsub([2,4,5,7,8,9,10,14,16],:)','o-','color',[0 0 0],'Linewidth',2)

xlim([0 3])
ylim([-150 100])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'有','無'}));
set(gca,'FontSize',25)
ylabel('ERD/%')
% title('ERD全トライアル平均')
set(disp1,'position',[500 300 600 700]);

% disp2=figure(2);
% plot(ERD_allsub','o-','Linewidth',2);
% 
% xlim([0 3])
% ylim([-30 30])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'有','無'}));
% set(gca,'FontSize',25)
% ylabel('ERD ,%')
% % title('ERD全トライアル平均')
% set(disp2,'position',[500 300 600 700]);

% disp3=figure(3);
% plot(ERD_allsub([6],:)','o-','color',[0 0 0]);
% hold on
% plot(ERD_allsub([1,2,3,4,5,7,8,9,10,11,12],:)','o-','color',[0.6 0.6 0.6]);
% 
% xlim([0 3])
% ylim([-150 100])
% set(gca,'XTick',([1;2]));
% set(gca,'XTickLabel',({'有','無'}));
% set(gca,'FontSize',20)
% ylabel('ERD/%')
% % title('ERD全トライアル平均')
% set(disp3,'position',[500 500 400 500]);