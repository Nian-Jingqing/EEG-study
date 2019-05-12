clc
clear all
Fs=1000;
%α帯%
Freq_max               =   13;
Freq_min               =   8;
%バンドパスフィルタ%
Band                   =   [8 13];
Wn                     =   Band/(Fs/2); %passband
[B,A]                  =    butter(3, Wn);
%ノッチフィルタ%
stopBand               =   [49 51];
stopWn                 =   stopBand/(Fs/2);
[stopB,stopA]          =   butter(3,stopWn,'stop');
load('F:\ERD手技獲得用\a.mat');
%small Laplacian%
Data=a_20170925_063339mff(36,:)...
    -(a_20170925_063339mff(29,:))/6 ...
    -(a_20170925_063339mff(30,:))/6 ...
    -(a_20170925_063339mff(35,:))/6 ...
    -(a_20170925_063339mff(37,:))/6 ...
    -(a_20170925_063339mff(40,:))/6 ...
    -(a_20170925_063339mff(41,:))/6;
Data=double(Data); %double型に変換

Data=filt(B,A,Data);

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
DataA=zeros(10,12000);
for i=0:b2/3-1
    k=DIN(4,i*3+1);
    l=DIN(4,i*3+2);
    m=DIN(4,i*3+3);
    DataA(i+1,1:DIN(4,(i+1)*3+1)-m+1)=Data(1,m:DIN(4,(i+1)*3+1));
end
peakave=zeros(:,1);
for j=1:10
    DataM=DataA(j,:);
%     figure
%     plot(DataM);
%     hold on
    [yupper,ylower]=envelope(DataM,100,'peak');
%     plot(yupper,'-','Linewidth',3)
    fp=findpeaks(yupper);
    peakave(j)=mean(fp);
%     line([0 10000],[peakave peakave],'color','r','LineWidth',3,'Linestyle','-')
%     xlabel('Time [ms]');
%     ylabel('Amplitude [μV]');
end

result=mean(peakave);
