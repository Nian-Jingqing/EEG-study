clc
clear all
Fs=1000;
%α帯%
Freq_max               =   13;
Freq_min               =   8;
%バンドパスフィルタ%
Band                   =   [8 13];
Wn                     =   Band/(Fs/2); %passband
[B,A]                  =   butter(3, Wn);
%ノッチフィルタ%
stopBand               =   [49 51];
stopWn                 =   stopBand/(Fs/2);
[stopB,stopA]          =   butter(3,stopWn,'stop');
load('K:\実験データ\予備実験2\okamoto\okamoto_pre2_nonfeedback.mat');
%small Laplacian%
Data=okamoto_pre2_nonfeedback_20171028_020255mff2(36,:)...
    -(okamoto_pre2_nonfeedback_20171028_020255mff2(29,:))/6 ...
    -(okamoto_pre2_nonfeedback_20171028_020255mff2(30,:))/6 ...
    -(okamoto_pre2_nonfeedback_20171028_020255mff2(35,:))/6 ...
    -(okamoto_pre2_nonfeedback_20171028_020255mff2(37,:))/6 ...
    -(okamoto_pre2_nonfeedback_20171028_020255mff2(40,:))/6 ...
    -(okamoto_pre2_nonfeedback_20171028_020255mff2(41,:))/6;
Data=double(Data); %double型に変換

filtData=filter(B,A,Data);

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

%Dataを30トライアル分DataAに切り出し%
[b1,b2]=size(DIN);
DataA=zeros(10,16000);
DataY=zeros(10,16000);
for i=10:10+b2/25-1
    k=DIN(4,i*5+1);
    l=DIN(4,i*5+2);
    m=DIN(4,i*5+3);
    n=DIN(4,i*5+4);
    o=DIN(4,i*5+5);
    DataA(i+1-10,1:o-k+1)=Data(1,k:o);
    DataY(i+1-10,1:o-k+1)=filtData(1,k:o);
end

for i=1:10
    for j=1:16000
        if DataA(i,j)==0
            DataA(i,j)=NaN;
        end
        if DataY(i,j)==0
            DataY(i,j)=NaN;
        end
    end
end

%セグメントされた生波形%
% for i=1:10
%     figure
%     plot(DataA(i,1:21000));
% end

%従来のフィルタ処理%
mean(DataY(:,1:16000));
for i=1:10
    figure
    plot(DataY(i,1:16000));
    window_num=1+(16-1)/(1-0.9);
    DataD=zeros(151,1000);
 for j=1:window_num
    m=(j-1)*100;
    fftData=fft(DataY(i,1+m:1000+m)' .* hanning(Fs));
    DataD(j,:)=abs(fftData').^2/Fs;
    Ref=mean(DataD(31:41,:),2);
 end
end
figure
imagesc(0:16,0:999,DataD');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
ylim([0 50]);
set(gca,'ydir','normal')
line([5 5],[0 50],'color','r','LineWidth',3,'Linestyle','-');
line([6 6],[0 50],'color','r','LineWidth',3,'Linestyle','-');
line([11 11],[0 50],'color','r','LineWidth',3,'Linestyle','-');
%%Calibrationのやり方(暫定)%%
FPave=zeros(1,10);
for i=1:10
figure
plot(DataY(i,1:5000));
hold on
ABS=abs(DataY(i,1:5000));
MovAve=movmean(ABS,[88 0]); %移動平均点数はこれで確定?%
plot(MovAve);
[yupper,~]=envelope(MovAve(1:5000),80,'peak');
plot(yupper);
findpeaks(yupper(1:5000),'MinPeakDistance',200)
FP=findpeaks(yupper(1:5000),'MinPeakDistance',200);
FPave(i)=mean(FP);
line([0 5000],[FPave(i) FPave(i)],'color','r','Linestyle','-');
xlabel('時間 [ms]'); 
ylabel('脳波振幅 [μV]');
xlim([0 5000]);
hold off
% figure
% window_num=1+(5-1)/(1-0.9);
% range=0:1:Fs/2;
% DataX=zeros(41,1000);
% for j=1:window_num
%     m=(j-1)*100;
%     fftData=fft(ABS(1,1+m:1000+m)'.* hanning(Fs));
%     DataX(j,:)=abs(fftData').^2/Fs;
% end
% meanDataX=mean(DataX,1);
% plot(range',meanDataX(1:length(range)),'Linewidth',2);
% xlim([0 50])
% xlabel('Frequency [Hz]');
% ylabel('PSD [μV^2]');
% ValueDec=FPave(i)-MovAve(6001:12000);
% PercentDec=100*(FPave(i)-MovAve(6001:12000))/FPave(i);
% figure
% histogram(ValueDec,'Binwidth',0.1)
% figure
% histogram(PercentDec,'Binwidth',10)
end
result=zeros(1,4);
result(1)=var(FPave);
result(2)=mean(FPave);
result(3)=median(FPave);
result(4)=mode(FPave);

%ヒストグラム%
HistData=zeros(10,10);
HistData2=zeros(10,10);
HistData3=zeros(10,10);
HistData4=zeros(10,10);
HistData5=zeros(10,10);
HistData6=zeros(5,10);
HistData7=zeros(5,10);
HistData8=zeros(5,10);
HistData9=zeros(5,10);
HistData10=zeros(5,10);
%%
% 
% * ITEM1
% * ITEM2
% 
a=median(HistData,1);
b=median(HistData2,1);
c=median(HistData3,1);
d=median(HistData4,1);
e=median(HistData5,1);
figure
histogram(HistData,20)
[h1,p1]=kstest(HistData);
xlabel('Amplitude [μV]'); 
ylabel('Frequency');
ylim([0 30])
figure
histogram(HistData2,20)
[h2,p2]=kstest(HistData2);
xlabel('Amplitude [μV]'); 
ylabel('Frequency'); 
ylim([0 30])
figure
histogram(HistData3,20)
[h3,p3]=kstest(HistData3);
xlabel('Amplitude [μV]'); 
ylabel('Frequency'); 
ylim([0 30])
figure
histogram(HistData4,20)
[h4,p4]=kstest(HistData4);
xlabel('Amplitude [μV]'); 
ylabel('Frequency');
ylim([0 30])
figure
histogram(HistData5,20)
[h5,p5]=kstest(HistData5);
xlabel('Amplitude [μV]'); 
ylabel('Frequency');
ylim([0 30])
%箱ひげ図
figure
boxplot(HistData')
xlabel('Session'); 
ylabel('Amplitude [μV]');
ylim([0 2])
figure
boxplot(HistData2')
xlabel('Session'); 
ylabel('Amplitude [μV]');
ylim([0 2])
figure
boxplot(HistData3')
xlabel('Session'); 
ylabel('Amplitude [μV]');
ylim([0 2])
figure
boxplot(HistData4')
xlabel('Session'); 
ylabel('Amplitude [μV]');
ylim([0 2])
figure
boxplot(HistData5')
xlabel('Session'); 
ylabel('Amplitude [μV]');
ylim([0 2])

A=[0.5551 0.7398 0.5084 0.8806 0.6948];
B=[0.3885 0.6797 0.5684 0.8367 0.7460];
C=zeros(1,5);
for i=1:5
    C(i)=A(i)-B(i);
end
[hh,pp]=kstest(C);
[hh2,pp2]=ttest(C);

%PSD推定のやり方%
DataM=DataA(5,:);
RestPower=zeros(41,1);
window_num=1+(5-1)/(1-0.9);
range=0:1:Fs/2;
DataB=zeros(41,1000);
for i=1:window_num
    m=(i-1)*100;
    fftData=fft(abs(DataM(1,1+m:1000+m))' .* hanning(Fs));
    DataB(i,:)=abs(fftData').^2/Fs;
    RestPower(i)=sqrt(mean(DataB(i,8:13)));
end
meanDataB=mean(DataB,1);

ImagePower=zeros(80,1);
window_num=1+(6-1)/(1-0.9);
range=0:1:Fs/2;
DataC=zeros(51,1000);
for i=1:window_num
    m=(i-1)*100;
    fftData=fft(abs(DataM(1,6001+m:7000+m))' .* hanning(Fs));
    DataC(i,:)=abs(fftData').^2/Fs;
    ImagePower(i)=DataC(i,10);
end
meanDataC=mean(DataC,1);

figure
plot(range',meanDataB(1:length(range)),'Linewidth',2);
hold on
plot(range',meanDataC(1:length(range)),'Linewidth',2);
% fp2=max(meanDataB);
xlim([0 50])
xlabel('Frequency [Hz]');
ylabel('PSD [μV^2]');
legend('Rest','Image');
legend('boxoff');

%Time-Frequency Mapの書き方%
window_num=1+(18.9-1)/(1-0.9);
range=0:1:Fs/2;
DataD=zeros(100,1000);
for i=1:window_num
    m=(i-1)*100;
    fftData=fft(DataM(1,1+m:1000+m)' .* hanning(Fs));
    DataD(i,:)=abs(fftData').^2/Fs;
end

figure
imagesc(0:19,0:999,DataD');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
ylim([0 50]);
set(gca,'ydir','normal')
line([10 10],[0 50],'color','r','LineWidth',3,'Linestyle','-');

%10Hz帯のパワーの比較(Wilcoxon検定)%
maxRestPower=zeros(30,1);
maxImagePower=zeros(30,1);
for i=1:30
   DataM=DataA(i,:);
   RestPower=zeros(91,1);
   window_num=1+(10-1)/(1-0.9);
   range=0:1:Fs/2;
   DataB=zeros(100,1000);
    for j=1:window_num
        m=(j-1)*100;
        fftData=fft(DataM(1,1+m:1000+m)' .* hanning(Fs));
        DataB(j,:)=abs(fftData').^2/Fs;
        RestPower(j)=DataB(j,10);
    end
    maxRestPower(i)=max(RestPower);
    
   ImagePower=zeros(80,1);
   window_num=1+(8.9-1)/(1-0.9);
   range=0:1:Fs/2;
   DataC=zeros(80,1000);
    for j=1:window_num
        m=(j-1)*100;
        fftData=fft(DataM(1,10001+m:11000+m)' .* hanning(Fs));
        DataC(j,:)=abs(fftData').^2/Fs;
        ImagePower(j)=DataC(j,10);
    end
    maxImagePower(i)=max(ImagePower);
   
end
[h,p]=vartest2(maxRestPower,maxImagePower);

[p2,h2]=ranksum(maxRestPower,maxImagePower);

ramda=zeros(30,2);
for i=1:30
    ramda(i,1)=maxRestPower(i);
    ramda(i,2)=maxImagePower(i);
end

figure
plot(ramda','Marker','o','Linestyle','none','color','b','MarkerFaceColor','b');
ylabel('PSD [μV^2]');
xlim([0 3]);
ylim([0 300]);

y=max(DataB);








