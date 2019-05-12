clear all
close all

for j=1:6
    dir = ('G:\脳波データ(済生会AF除去)'); %フォルダ識別
    data_mat = ['nagai',num2str(j)];
    load([dir,'\',data_mat]); %データ読み取り
    
    trial_num = 20; %トライアル回
    pos3 = [1090 50 600 450];
    EEGSamplingRate = 200;
    BufferAR=detrend(BufferAR);
    
    for i = 1:trial_num
        C3_segment(:,i) = BufferAR(1201+4800*(i-1):4800*i); %DIN3基準でRest開始からRest2終了までセグメント
    end
    
    alltrial = ones(1,20);
    
    
    disp1 = figure(j+10);
    for i = 1:trial_num
        subplot(4,5,i)
        plot(1:5:size(C3_segment,1)*5,C3_segment(:,i));
        line([9000/5 9000/5],[-20 20],'color','r');
        %         ylim([-20 20])
        xlim([0 18000/5])
        noise = findpeaks(abs(C3_segment(:,i))','MinPeakHeight',60);
        if isempty(noise)==false
            alltrial(i)=0;
        end
        
    end
    set(disp1,'position',[1920 0 1680 970]);
    
    H = repmat(hanning(EEGSamplingRate),[1,trial_num]); %窓関数
    window_length = EEGSamplingRate; %1秒窓
    overlap_rate = 0.9; %90%オーバーラップ
    window_start = round(1:window_length*(1-0.9):length(C3_segment)-window_length+1); %各windowの開始点
    
    
    for i = 1:length(window_start)
        C3_power(:,i,:) = abs(fft(C3_segment(window_start(i):window_start(i)+EEGSamplingRate-1,:).*H)).^2; %[f window_num trial]
    end
    
    ref = repmat(mean(C3_power(:,1:81,:),2),[1,size(C3_power,2),1]); %Referenceの窓平均
    ERD = ((ref-C3_power)./ref)*100; %ERDのパーセンテージ表示
    ERD_average = mean(ERD,3);
    
    
    %個別のトライアル表示
    disp2 = figure(j);
    for i=1:trial_num
        subplot(4,5,i)
        f = 0:1:249;
        clims = [-100,100];
        imagesc(0:18,f,ERD(:,:,i),clims)
        c=jet;
        c=flipud(c);
        colormap(c);
        c=colorbar;
        c.Label.String='ERD/ERS(%)';
        xlabel('Time [s]','FontName','Helvetica');
        ylabel('Frequency [Hz]','FontName','Helvetica');
        ylim([0 50]);
        set(gca,'ydir','normal','FontName','Helvetica');
    end
    set(disp2,'position',[0 0 1920 1080]);
    
    denoise_trial = find(alltrial);
    ERD_denoise = ERD(:,:,denoise_trial);
    
    figure(j+100); clf(gcf); set(gcf,'position',pos3);
    imagesc(0:18,0:50,mean(ERD_denoise,3));
    set(gca,'ydir','normal','clim',[-100 100],'fontsize',20);
    c=jet;
    c=flipud(c);
    colormap(c);
    c=colorbar;
    c.Label.String='ERD,%';
    caxis([-100 100]);
    line([9 9],[0 200],'color','r','LineWidth',3,'Linestyle','-');
    set(gca,'FontSize',20,'FontName','Helvetica')
    xlabel('Time (s)');
    ylabel('Frequency (Hz)');
    drawnow;
    
    save([data_mat,'_denoise'],'ERD_denoise');
    
    clear -regexp ^nakamura
end

