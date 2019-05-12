clear all
close all

ERD_all=zeros(9,1000,171);
% ERD_all=zeros(6,51,180);
ERD_allave = zeros(1,2);
freq_fb = 9:13;
for j=1:9
    dir = ('G:\脳波データ(矢上ノイズ除去TF3-9s)'); %フォルダ識別
%     dir = ('G:\脳波データ(済生会ノイズ除去TF)');
    data_mat = ['iwama',num2str(j),'_denoise'];
    load([dir,'\',data_mat]); %データ読み取り
%     temp = whos('*mff');
%     eval(['ERD = ',ERD_denoise,';']);
    
  
    ERD_average = mean(ERD_denoise,3);
    ERD_all(j,:,:) = ERD_average;
    clear -regexp ERD_denoise
end

% ERD_ave=zeros(20,2);
% for i=1:trial_num
%     ERD_ave(i,1)=i;
%     ERD_freq=squeeze(mean(ERD(12:20,:,i),1));
%     ERD_ave(i,2)=mean(ERD_freq(81:171));
% end
%
% ERD_sort=sort(ERD_ave(:,2),'descend');
% ERD_sort=ERD_sort(1:10);
% Good_trial=zeros(10,1);
% for i=1:10
%     for j=1:trial_num
%         if ERD_sort(i)==ERD_ave(j,2)
%             Good_trial(i)=ERD_ave(j,1);
%             break;
%         end
%     end
% end
% Good_trial=sort(Good_trial);

%個別のトライアル表示
% figure
% for i=1:trial_num
%     subplot(4,5,i)
%     f = 0:1:1000-1;
%     clims = [-100,100];
%     imagesc(0:18,f,ERD(:,:,i),clims)
%     c=jet;
%     c=flipud(c);
%     colormap(c);
%     c=colorbar;
%     c.Label.String='ERD/ERS(%)';
%     xlabel('Time [s]','FontName','Helvetica');
%     ylabel('Frequency [Hz]','FontName','Helvetica');
%     ylim([0 50]);
%     set(gca,'ydir','normal','FontName','Helvetica')
%     line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
% %     line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');
% end

% ERD_average = mean(ERD_all,4);
% ERD_average = mean(ERD(:,:,Good_trial),3); %パーセンテージまでやってからトライアル加算平均
% % ERD_amount = zeros(1000,171,20);
% ERD_amount(:,:,11:20) = ERD(:,:,Good_trial);
% % ERD_amount_m = mean(ERD_amount(:,:,[1:15,17:20]),3);

% t = window_start/EEGSamplingRate+1;


f = 0:1:1000-1;
disp1 = figure(100);
for j=1:9
    subplot(2,5,j);
    clims = [-100,100];
    imagesc(0:18,f,squeeze(ERD_all(j,:,:)),clims)
    c=jet;
    c=flipud(c);
    colormap(c);
    c=colorbar;
    c.Label.String='ERD /%';
    xlabel('Time [s]','FontSize',20,'FontName','Helvetica');
    ylabel('Frequency [Hz]','FontSize',20,'FontName','Helvetica');
    ylim([0 50]);
    set(gca,'ydir','normal')
    set(gca,'FontSize',25,'FontName','Helvetica')
    line([9 9],[0 200],'color','r','LineWidth',2,'Linestyle','-');
end
set(disp1,'position',[1920 0 600 500]);

ERD_foi_ave = squeeze(mean(ERD_all(:,freq_fb,:),2));
figure(200)
boxplot(ERD_foi_ave(:,91:171)');

%%with→without
ERD_FB = squeeze(mean(ERD_all([1,3,5,7],freq_fb,91:171),2));
ERD_noFB = squeeze(mean(ERD_all([2,4,6,8],freq_fb,91:171),2));


%%without→with
% ERD_FB = squeeze(mean(ERD_all([2,4,6,8],freq_fb,91:171),2));
% ERD_noFB = squeeze(mean(ERD_all([1,3,5,7],freq_fb,91:171),2));

ERD_FBwindowave = squeeze(mean(ERD_FB,2));
ERD_noFBwindowave = squeeze(mean(ERD_noFB,2));
ERD_allave(1)=mean(ERD_FBwindowave);
ERD_allave(2)=mean(ERD_noFBwindowave);

figure
plot(1,ERD_FBwindowave,'o')
hold on
plot(2,ERD_noFBwindowave,'o')
xlim([0 3])
ylim([-200 100])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'withFB','withoutFB'}));
set(gca,'FontSize',12)
ylabel('ERD')
title('ERDave')

save('iwama_ERDave','ERD_allave')
