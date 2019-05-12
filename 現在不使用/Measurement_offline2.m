Fs=1000;
%α帯%
Freq_max               =   13;
Freq_min               =   8;
%バンドパスフィルタ%
Band                   =   [8 13];
Wn                     =   Band/(Fs/2); %passband
[B,A]                  =   butter(3, Wn);
%バンドパスフィルタ2%
Band                   =   [3 100];
Wn                     =   Band/(Fs/2); %passband
[B2,A2]                =   butter(2, Wn);
%ノッチフィルタ%
stopBand               =   [49 51];
stopWn                 =   stopBand/(Fs/2);
[stopB,stopA]          =   butter(3,stopWn,'stop');
% load('F:\実験データ\予備実験2\Shibusawa\Shibusawa_pre2_nonfeedback5.mat');
% %small Laplacian%
% Data=Shibusawa_pre2_nonfeedback5_20171102_071944mff(36,:)...
%     -(Shibusawa_pre2_nonfeedback5_20171102_071944mff(29,:))/6 ...
%     -(Shibusawa_pre2_nonfeedback5_20171102_071944mff(30,:))/6 ...
%     -(Shibusawa_pre2_nonfeedback5_20171102_071944mff(35,:))/6 ...
%     -(Shibusawa_pre2_nonfeedback5_20171102_071944mff(37,:))/6 ...
%     -(Shibusawa_pre2_nonfeedback5_20171102_071944mff(42,:))/6 ...
%     -(Shibusawa_pre2_nonfeedback5_20171102_071944mff(41,:))/6;
% Data=double(Data); %double型に変換

dir = ('K:\実験データ\メイン実験(脳波)\kiriyama10'); %フォルダ識別
data_mat = 'kiriyama_pre_2';
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
trial_num = 10; %トライアル回数

EEG = double(data); %要素をdouble型に変更
% Lap = (EEG(29,:)+EEG(30,:)+EEG(35,:)+EEG(37,:)+EEG(41,:)+EEG(42,:))/6; 
C3 = EEG(36,:)'; %CAR

C3filt = filtfilt(stopB,stopA,C3);
C3filt = filtfilt(B,A,C3filt); %detrend必要なしか

figure
plot(C3filt)

%evt_255_DINsをdouble型のDINに変換%
[a1,a2]=size(evt_255_DINs);
DIN=zeros(4,a2);
DINstr=evt_255_DINs(1,1:a2);
for i=1:a2
    if strcmp(DINstr(i),'DIN1')==1
        DIN(1,i)=1;
    elseif strcmp(DINstr(i),'DIN2')==1
        DIN(1,i)=2;
    elseif strcmp(DINstr(i),'DIN3')==1
        DIN(1,i)=3;
    elseif strcmp(DINstr(i),'DIN4')==1
        DIN(1,i)=4;
    elseif strcmp(DINstr(i),'DIN5')==1
        DIN(1,i)=5;
    elseif strcmp(DINstr(i),'DIN7')==1
        DIN(1,i)=7;
    end
end
DINnum=evt_255_DINs(2:4,1:a2);
DIN(2:4,1:a2)=cell2mat(DINnum);

%DIN7成分の削除%
r=find(DIN(1,:)==7);
DIN(:,r)=[];

%Dataを10トライアル分切り出し%
[b1,b2]=size(DIN);
DataA=zeros(10,16000);
DataY=zeros(10,16000);
DataX=zeros(10,16000);
for i=0:b2/5-1
    k=DIN(4,i*5+1);
    l=DIN(4,i*5+2);
    m=DIN(4,i*5+3);
    n=DIN(4,i*5+4);
    o=DIN(4,i*5+5);
    DataA(i+1,1:o-k+1)=Data(1,k:o);
    DataY(i+1,1:o-k+1)=filtData(1,k:o);
    DataX(i+1,1:o-k+1)=filtData2(1,k:o);
end


for i=1:10
    for j=1:16000
        if DataA(i,j)==0
            DataA(i,j)=NaN;
        end
        if DataY(i,j)==0
            DataY(i,j)=NaN;
        end
        if DataX(i,j)==0
            DataX(i,j)=NaN;
        end
    end
end

Datasum(41:50,:)=DataX(1:10,1:16000);

%セグメントされた生波形%
% for i=1:10
%     figure
%     plot(DataA(i,1:21000));
% end

%8-13Hz Bandpass%
scrsz = get(groot,'ScreenSize');
figure('Position',[1,1,scrsz(3)/2,scrsz(4)])
for i=1:10
    subplot(5,2,i)
    plot(DataY(i,1:16000));
    xlabel('Time [ms]');
    ylabel('Amplitude [μV]');
    line([3000 3000],ylim,'color','b','LineWidth',1,'Linestyle','-');
    line([5000 5000],ylim,'color','b','LineWidth',1,'Linestyle','-');
    line([6000 6000],ylim,'color','r','LineWidth',1,'Linestyle','-');
    line([11000 11000],ylim,'color','r','LineWidth',1,'Linestyle','-');
end

%0.01-100Hz Bandpass%
scrsz = get(groot,'ScreenSize');
figure('Position',[1,1,scrsz(3)/2,scrsz(4)])
for i=1:10
    subplot(5,2,i)
    plot(DataX(i,1:16000));
    xlabel('Time [ms]');
    ylabel('Amplitude [μV]');
    line([3000 3000],ylim,'color','b','LineWidth',1,'Linestyle','-');
    line([5000 5000],ylim,'color','b','LineWidth',1,'Linestyle','-');
    line([6000 6000],ylim,'color','r','LineWidth',1,'Linestyle','-');
    line([11000 11000],ylim,'color','r','LineWidth',1,'Linestyle','-');
end

% %PSD推定のやり方%
% figure('Position',[scrsz(3)/2+1,1,scrsz(3)/2,scrsz(4)])
% for n=1:10
% DataZ=DataX(n,:);
% 
% % window_num=1+(5-1)/(1-0.9);
% % range=0:1:Fs/2;
% % DataB=zeros(41,1000);
% % for i=1:window_num
% %     m=(i-1)*100;
% %     fftData=fft(DataZ(1,1+m:1000+m)' .* hanning(Fs));
% %     DataB(i,:)=abs(fftData').^2/Fs;
% % end
% % meanDataB=mean(DataB,1);
% % 
% window_num=1+(2-1)/(1-0.9);
% range=0:1:Fs/2;
% DataE=zeros(11,1000);
% for i=1:window_num
%     m=(i-1)*100;
%     fftData=fft(DataZ(1,3001+m:4000+m)' .* hanning(Fs));
%     DataE(i,:)=abs(fftData').^2/Fs;
% end
% meanDataE=mean(DataE,1);
% 
% window_num=1+(5-1)/(1-0.9);
% range=0:1:Fs/2;
% DataC=zeros(41,1000);
% for i=1:window_num
%     m=(i-1)*100;
%     fftData=fft(DataZ(1,6001+m:7000+m)' .* hanning(Fs));
%     DataC(i,:)=abs(fftData').^2/Fs;
% end
% meanDataC=mean(DataC,1);
% % 
% % figure
% % plot(range',meanDataB(1:length(range)),'Linewidth',2);
% % hold on
% % plot(range',meanDataC(1:length(range)),'Linewidth',2);
% % % fp2=max(meanDataB);
% % xlim([0 50])
% % xlabel('Frequency [Hz]');
% % ylabel('PSD [μV^2]');
% % legend('Rest','Image');
% % legend('boxoff');
% 
% subplot(5,2,n)
% plot(range',meanDataE(1:length(range)),'Linewidth',2);
% hold on
% plot(range',meanDataC(1:length(range)),'Linewidth',2);
% xlim([0 50])
% xlabel('Frequency [Hz]');
% ylabel('PSD [μV^2]');
% line([8 8],ylim,'color','r','LineWidth',1,'Linestyle','-');
% line([13 13],ylim,'color','r','LineWidth',1,'Linestyle','-');
% legend('Rest','Image');
% legend('boxoff');
% end


%Time-Frequency Mapの書き方%
% figure('Position',[scrsz(3)/2+1,1,scrsz(3)/2,scrsz(4)])
% for n=41:50
% DataZ=DataX(n,:);
% window_num=1+(16-1)/(1-0.9);
% range=0:1:Fs/2;
% DataD=zeros(151,1000);
% for j=1:window_num
%     m=(j-1)*100;
%     fftData=fft(DataZ(1+m:1000+m)'.* hanning(Fs));
%     DataD(j,:)=abs(fftData').^2/Fs;
% end
% Ref=mean(DataD(31:41,:));
% DataF=zeros(151,1000);
% for k=1:window_num
% DataF(k,:)=(DataD(k,:)-Ref)./Ref*100;
% end
% subplot(5,2,n)
% clims=[-100 100];
% imagesc(0:16,0:999,DataF',clims);
% colormap jet
% c=colorbar;
% c.Label.String='ERP(%)';
% xlabel('Time [s]');
% ylabel('Frequency [Hz]');
% ylim([0 50]);
% set(gca,'ydir','normal')
% line([3 3],[0 200],'color','g','LineWidth',3,'Linestyle','-');
% line([5 5],[0 200],'color','g','LineWidth',3,'Linestyle','-');
% line([6 6],[0 200],'color','r','LineWidth',3,'Linestyle','-');
% line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');
% end

%Time-Frequency Map(加算平均)%
figure
DataZ=mean(Datasum(1:50,:));
window_num=1+(16-1)/(1-0.9);
range=0:1:Fs/2;
DataD=zeros(151,1000);
for j=1:window_num
    m=(j-1)*100;
    fftData=fft(DataZ(1+m:1000+m)'.* hanning(Fs));
    DataD(j,:)=abs(fftData').^2/Fs;
end
Ref=mean(DataD(31:41,:));
DataF=zeros(151,1000);
for k=1:window_num
DataF(k,:)=(DataD(k,:)-Ref)./Ref*100;
end
clims=[-100 100];
imagesc(0:16,0:999,DataF',clims);
colormap jet
c=colorbar;
c.Label.String='ERP(%)';
xlabel('Time [s]');
ylabel('Frequency [Hz]');
ylim([0 50]);
set(gca,'ydir','normal')
line([3 3],[0 200],'color','g','LineWidth',3,'Linestyle','-');
line([5 5],[0 200],'color','g','LineWidth',3,'Linestyle','-');
line([6 6],[0 200],'color','r','LineWidth',3,'Linestyle','-');
line([11 11],[0 200],'color','r','LineWidth',3,'Linestyle','-');

%窓ごとのERDのヒストグラムの書き方%
% figure('Position',[scrsz(3)/2+1,1,scrsz(3)/2,scrsz(4)])
% for n=1:10
% DataZ=DataX(n,:);
% ERDData=zeros(1,51);
% Mov(1:10)=0;
% MovAve=zeros(1,51);
% for i=1:51
% ERDData(i)=mean(DataF(50+i,Freq_min:Freq_max));
% Mov(1:9)    =   Mov(2:10);
% Mov(10)=max(min(100,ERDData(i)),-100);
% MovAve(i)    =   mean(Mov(1:10));
% end
% HistData1(10,:)=-MovAve;%←ここを変えましょう
% plot(-MovAve)
% grid on
% hold on
% line([0 51],[60 60],'color','r','LineWidth',2,'Linestyle','-');
% xlim([0 51])
% ylim([0 100])
% end

% figure
% edges=(0:10:100);
% h=histogram(HistSumf(1:20,:),edges);
% xlim([0,100])
% ylim([0,80])
% 
% figure
% edges=(0:10:100);
% h2=histogram(HistSumn(1:20,:),edges);
% xlim([0,100])
% % ylim([0,80])
% 
% figure
% edges=(0:10:100);
% h3=histogram(HistSumall(1:40,:),edges);
% xlim([0,100])
% % ylim([0,80])
% 
% 
% 
% Cont1=zeros(10,41);
% for i=1:10
%     for j=1:41
%         if HistData(i,j)>0&&HistData(i,j)<=10
%             Cont1(i,j)=1;
%         elseif HistData(i,j)>10&&HistData(i,j)<=20
%             Cont1(i,j)=2;
%         elseif HistData(i,j)>20&&HistData(i,j)<=30
%             Cont1(i,j)=3;
%         elseif HistData(i,j)>30&&HistData(i,j)<=40
%             Cont1(i,j)=4;
%         elseif HistData(i,j)>40&&HistData(i,j)<=50
%             Cont1(i,j)=5;
%         elseif HistData(i,j)>50&&HistData(i,j)<=60
%             Cont1(i,j)=6;
%         elseif HistData(i,j)>60&&HistData(i,j)<=70
%             Cont1(i,j)=7;
%         elseif HistData(i,j)>70&&HistData(i,j)<=80
%             Cont1(i,j)=8;
%         elseif HistData(i,j)>80&&HistData(i,j)<=90
%             Cont1(i,j)=9;
%         elseif HistData(i,j)>90&&HistData(i,j)<=100
%             Cont1(i,j)=10;
%         else
%             Cont1(i,j)=0;
%         end
%     end
% end
% 
% Cont2=zeros(10,41);
% for i=1:10
%     for j=1:41
%         if HistData2(i,j)>0&&HistData2(i,j)<=10
%             Cont2(i,j)=1;
%         elseif HistData2(i,j)>10&&HistData2(i,j)<=20
%             Cont2(i,j)=2;
%         elseif HistData2(i,j)>20&&HistData2(i,j)<=30
%             Cont2(i,j)=3;
%         elseif HistData2(i,j)>30&&HistData2(i,j)<=40
%             Cont2(i,j)=4;
%         elseif HistData2(i,j)>40&&HistData2(i,j)<=50
%             Cont2(i,j)=5;
%         elseif HistData2(i,j)>50&&HistData2(i,j)<=60
%             Cont2(i,j)=6;
%         elseif HistData2(i,j)>60&&HistData2(i,j)<=70
%             Cont2(i,j)=7;
%         elseif HistData2(i,j)>70&&HistData2(i,j)<=80
%             Cont2(i,j)=8;
%         elseif HistData2(i,j)>80&&HistData2(i,j)<=90
%             Cont2(i,j)=9;
%         elseif HistData2(i,j)>90&&HistData2(i,j)<=100
%             Cont2(i,j)=10;
%         else
%             Cont2(i,j)=0;
%         end
%     end
% end
% 
% Cont3=zeros(10,41);
% for i=1:10
%     for j=1:41
%         if HistData3(i,j)>0&&HistData3(i,j)<=10
%             Cont3(i,j)=1;
%         elseif HistData3(i,j)>10&&HistData3(i,j)<=20
%             Cont3(i,j)=2;
%         elseif HistData3(i,j)>20&&HistData3(i,j)<=30
%             Cont3(i,j)=3;
%         elseif HistData3(i,j)>30&&HistData3(i,j)<=40
%             Cont3(i,j)=4;
%         elseif HistData3(i,j)>40&&HistData3(i,j)<=50
%             Cont3(i,j)=5;
%         elseif HistData3(i,j)>50&&HistData3(i,j)<=60
%             Cont3(i,j)=6;
%         elseif HistData3(i,j)>60&&HistData3(i,j)<=70
%             Cont3(i,j)=7;
%         elseif HistData3(i,j)>70&&HistData3(i,j)<=80
%             Cont3(i,j)=8;
%         elseif HistData3(i,j)>80&&HistData3(i,j)<=90
%             Cont3(i,j)=9;
%         elseif HistData3(i,j)>90&&HistData3(i,j)<=100
%             Cont3(i,j)=10;
%         else
%             Cont3(i,j)=0;
%         end
%     end
% end
% 
% Cont4=zeros(10,41);
% for i=1:10
%     for j=1:41
%         if HistData4(i,j)>0&&HistData4(i,j)<=10
%             Cont4(i,j)=1;
%         elseif HistData4(i,j)>10&&HistData4(i,j)<=20
%             Cont4(i,j)=2;
%         elseif HistData4(i,j)>20&&HistData4(i,j)<=30
%             Cont4(i,j)=3;
%         elseif HistData4(i,j)>30&&HistData4(i,j)<=40
%             Cont4(i,j)=4;
%         elseif HistData4(i,j)>40&&HistData4(i,j)<=50
%             Cont4(i,j)=5;
%         elseif HistData4(i,j)>50&&HistData4(i,j)<=60
%             Cont4(i,j)=6;
%         elseif HistData4(i,j)>60&&HistData4(i,j)<=70
%             Cont4(i,j)=7;
%         elseif HistData4(i,j)>70&&HistData4(i,j)<=80
%             Cont4(i,j)=8;
%         elseif HistData4(i,j)>80&&HistData4(i,j)<=90
%             Cont4(i,j)=9;
%         elseif HistData4(i,j)>90&&HistData4(i,j)<=100
%             Cont4(i,j)=10;
%         else
%             Cont4(i,j)=0;
%         end
%     end
% end
% 
% figure
% edges=(0:10:100);
% h=histogram(HistSumf(1:20,:),edges);
% xlim([0,100])
% ylim([0,150])
% 
% figure
% edges=(0:10:100);
% h2=histogram(HistSumn(1:20,:),edges);
% xlim([0,100])
% ylim([0,150])
% 
% figure
% edges=(0:10:100);
% h3=histogram(HistSumall(1:40,:),edges);
% xlim([0,100])
% ylim([0,150])
% 
% for i=1:4
%     figure
%     bar(10:10:100,Subf(i,:))
%     ylim([0 10])
% end
% 
% figure
% bar(10:10:100,sum(Subf(1:4,:),1))
% ylim([0 10])
% 
% for i=1:4
%     figure
%     bar(10:10:100,Subn(i,:))
%     ylim([0 10])
% end
% 
% figure
% bar(10:10:100,sum(Subn(1:4,:),1))
% ylim([0 10])
% 
% for i=1:4
%     figure
%     bar(10:10:100,Sum(i,:))
%     ylim([0 10])
% end
% 
% figure
% bar(10:10:100,sum(Sum(1:4,:),1))
% ylim([0 10])
