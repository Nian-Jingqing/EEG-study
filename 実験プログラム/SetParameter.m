clear figure 10 figure 100
Fs   = 1000;
% scrsz = get(groot,'ScreenSize');
%%KiPAS用
if Th==1||Th==4||Th==8||Th==9
    pos1=[scrsz(3)+1 -200 1950 2356];
else
    pos1=[scrsz(3)+1 -200 975 1178];
end
%%5F用
% if Th==1||Th==2||Th==4||Th==8||Th==9
%     pos1=[scrsz(3)+1 0 1950 1200];
% else
%     pos1=[scrsz(3)+1 0 975 1178];
% end
disp    =   figure(10); %キュー
set(gcf,'color',[0 0 0],'position',pos1,'menu','none','toolbar','none');axis off;axis tight;%color[0,0,0]←背景が黒 position←ウィンドウの表示位置
%menu←ウィンドウのう上にメニューバーが出る toolbar←ウィンドウの上にツールバーが出る axis off←目盛りを出さない
t       =   text(1,1,'REST','fontsize',160,'color','y','FontWeight','bold','HorizontalAlignment','center');ylim([0 3]);xlim([0 2]);
t2      =   text(1,2,'   ','fontsize',80,'color','y','FontWeight','bold','HorizontalAlignment','center');
%'Rest'の文字やら位置やらの指定
% 
if Th~=1&&Th~=9
disp2   =   figure(100);%No100 is ERD FeedBack
hold on;
line0   =   line([-140 140],[0 0],'color','g','LineWidth',2); %ラインの設定、位置
% line1   =   line([-140 140],[40 40],'color','b','LineWidth',2,'Linestyle',':');
% line2   =   line([-140 140],[50 50],'color','b','LineWidth',2,'Linestyle','-.');
Goal    =   rectangle('Position',[-140 45 280 10],'EdgeColor','y','FaceColor',[0.95 0.6 0]);
% Goal    =   line([-140 140],[60 60],'color','y','LineWidth',2,'Linestyle','-');
uistack(line0,'top');
% uistack(line1,'top');
% uistack(line2,'top');
uistack(Goal,'top');
plot0   =   plot(0,0,'w.','MarkerSize',50); %白点カーソル
uistack(plot0,'top');
%%KiPAS用
if Th==4||Th==8
pos2=[1 1 scrsz(3)/2 scrsz(4)];%←こっちを調整
else
pos2=[2550 -200 975 1178];
end
%%5F用
% if Th==2||Th==4||Th==8
% pos2=[1 1 scrsz(3)/2 scrsz(4)];%←こっちを調整
% else
% pos2=[3530 0 975 1178];
% end 
set(gcf,'menu','none','toolbar','none','position',pos2,'color',[0 0 0]) %figure(100)のウィンドウ設定
axis tight;
axis off


xlim([-150 150])
ylim([-10 100])
hold off;
end


%% 1.Setpalameter

    ch(1:7)                =   [29,30,35,36,37,41,42]; %計測部分とその近傍
%1.2 Frequency
    Freq_max               =   14;
    Freq_min               =   9;       %α帯 8-13 Hz
%1.3 Trial Num
    %BCI.mに貼り付け
%1.4 Filter→バンドパスフィルタ
    Band                   =   [3 70];
    Wn                     =   Band/(Fs/2); %passband
    [B,A]                  =    butter(3, Wn); %Wnは正規化されたカットオフ周波数
    
    EMG_Band                   =   [5 400];
    EMG_Wn                     =   [EMG_Band(1) EMG_Band(2)]/(Fs/2);
    [EMGB,EMGA]                =    butter(3, EMG_Wn);
    
    
%1.5 Band stop filter→ノッチフィルタ
    stopBand               =   [49 51];
    stopWn                 =   stopBand/(Fs/2);
    [stopB,stopA]          =   butter(3,stopWn,'stop');
    
    stopBand               =   [99 101];
    stopWn                 =   stopBand/(Fs/2);
    [stopB2,stopA2]        =   butter(3,stopWn,'stop');

    stopBand               =   [149 151];
    stopWn                 =   stopBand/(Fs/2);
    [stopB3,stopA3]        =   butter(3,stopWn,'stop');
    
    stopBand               =   [199 201];
    stopWn                 =   stopBand/(Fs/2);
    [stopB4,stopA4]        =   butter(3,stopWn,'stop');
    
    stopBand               =   [249 251];
    stopWn                 =   stopBand/(Fs/2);
    [stopB5,stopA5]        =   butter(3,stopWn,'stop');
    
    stopBand               =   [299 301];
    stopWn                 =   stopBand/(Fs/2);
    [stopB6,stopA6]        =   butter(3,stopWn,'stop');
% %1.6 Difine buffering→たぶん使わんらしい
%     eSample                =    zeros(2*Fs,129); %% リアルタイムで参照できるデータ配列を2*Fsの長さに変更
%     stac                   =    zeros(11,1);



%2.1 setting&Initializetion
%2.1.1 makeFB figure
    Mov(1:10)           =    0;
    r                   =    randperm(20);
    count               =    1;
    ERDcount            =    1;
    countpl             =    1;
    count_sample        =    1;
    count_reset         =    300000;
    precount_sample     =    1;
    RestStopper         =    0;
    RestStopper2        =    0;
    ReadyStopper        =    0;
    BreakStopper        =    0;
    TaskStopper         =    0;
    CountResetStopper   =    0;
    SuccessResultStopper=    0;
    RCStopper           =    0;
    CloserStopper       =    0;
    BufferStopper       =    0;
    NumOfStim           =    0;
    SuccessNum          =    0;
    SuccessPoint        =    0;
    penalty             =    0;
    SuccessCount        =    0;
    trial_count         =    1;
    set_count           =    1;
    ValueValue          =    [0 0];
    Goal1               =    45;
    Goal2               =    55;
    Goal3               =    60;
    MVC                 =    1000;
    Ref                 =    zeros(Fs,10);
    ERDData             =    zeros(10,50);
    if exist('SessionCount','var')==0
         SessionCount=1;
    end
    h=hanning(Fs);