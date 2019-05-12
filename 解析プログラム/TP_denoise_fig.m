clear all
close all
Data_all=zeros(129,10);
scrsz = get(groot,'Screensize');
sub_name={'kobayashi','hara','okamoto','nagai','kida','kiriyama','hosoda','fukuoka','fujimoto','nakamura','uehata','yamazaki','iwama','fujimon','fukuda','hirose'};
for k=16
    for j=1:9
        dir = ('G:\矢上ノイズ除去TP(8-12Hz)'); %フォルダ識別
%         dir = ('G:\矢上ノイズ除去TP(3-9s)'); 
        data_mat = [sub_name{k},num2str(j),'_denoise'];
        load([dir,'\',data_mat]); %データ読み取り
        %     temp = whos('*mff');
        %     eval(['ERD = ',ERD_denoise,';']);
        
        
        Data_all(:,j) = ERP_foi;
        clear -regexp ERD_foi
    end
    Data_ave(:,1) = squeeze(mean(Data_all(:,[1,3,5,7]),2));
    Data_ave(:,2) = squeeze(mean(Data_all(:,[2,4,6,8]),2));
    run('ChannnelLocation.m');
    disp1 = figure(k);
    for j=1:2
        subplot(1,2,j)
        topography(Data_ave(:,j),loc,3);
        c=jet;
        c=flipud(c);
        colormap(c);
        c=colorbar;
        c.Label.String='ERD/ERS(%)';
        caxis([-100 100]);
        set(gcf,'position',[scrsz(3)/2+1,1,800,800],'color',[1 1 1]);
        set(gca,'FontSize',20,'FontName','Helvetica')
    end
    set(disp1,'position',[1920 0 1680 970]);
end