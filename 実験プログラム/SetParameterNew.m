clear figure 100
Fs   = 1000;
scrsz = get(groot,'ScreenSize');

disp2   =   figure(100);%No100 is ERD FeedBack
hold on;
if Th2==1
%     pos2=[2225 -250 975 2200];
    pos2=[640 0 640 800];
    set(gcf,'menu','none','toolbar','none','position',pos2,'color',[0 0 0]) %figure(100)のウィンドウ設定
    axis tight;
    axis off
    xlim([-1 1]);ylim([-1 1]);
    t=text(0,0,'REST','fontsize',100,'color','y','FontWeight','bold','HorizontalAlignment','center');
    if Th1==1
        tt=text(0,1,'Hand','fontsize',100,'color','c','FontWeight','bold','HorizontalAlignment','center');
    elseif Th1==2
        tt=text(0,1,'Foot','fontsize',100,'color','c','FontWeight','bold','HorizontalAlignment','center');
    elseif Th1==3
        tt=text(0,1,'Tongue','fontsize',100,'color','c','FontWeight','bold','HorizontalAlignment','center');
    end
elseif Th2==2
    line0   =   line([-140 140],[0 0],'color','g','LineWidth',2); %ラインの設定、位置
    % if Th==2
    % Goal    =   rectangle('Position',[-140 5 280 10],'EdgeColor','y','FaceColor',[0.95 0.6 0]);
    % else
    % Goal    =   rectangle('Position',[-140 25 280 10],'EdgeColor','y','FaceColor',[0.95 0.6 0]);
    % end
    % if Th~=3
    %     Goal    =   line([-140 140],[ERDGoal ERDGoal],'color','y','LineWidth',2,'Linestyle','-');%←被験者ごとに変更
    % end
    % line1   =   line([-140 140],[15 15],'color','r','LineWidth',2);
    % uistack(line0,'top');
    % uistack(Goal,'top');
    plot0   =   plot(0,0,'w.','MarkerSize',50); %白点カーソル
    uistack(plot0,'top');
    %%1人用
    % pos2=[1 1 scrsz(3) scrsz(4)];
    %%5F用
    pos2=[scrsz(3)+1 -400 1950 2356];
    %%KiPAS用
    % pos2=[scrsz(3)+1 -200 1950 2356];
    set(gcf,'menu','none','toolbar','none','position',pos2,'color',[0 0 0]) %figure(100)のウィンドウ設定
    axis tight;
    axis off
    xlim([-150 150]);ylim([-25 100]);
    % if Th==3
    %     ylim([-25 100])
    t=text(0,50,'REST','fontsize',100,'color','y','FontWeight','bold','HorizontalAlignment','center');
    if Th1==1
        tt=text(0,75,'Hand','fontsize',100,'color','c','FontWeight','bold','HorizontalAlignment','center');
    elseif Th1==2
        tt=text(0,75,'Foot','fontsize',100,'color','c','FontWeight','bold','HorizontalAlignment','center');
    end
    % else
    %     ylim([-25 ERDGoal+15])%←ERDGoal+10
    %     t=text(0,25,'REST','fontsize',100,'color','y','FontWeight','bold','HorizontalAlignment','center');
    % end
    hold off;
end


%% 1.Setpalameter
if Th1==1
    ch(1:7)                =   [29,30,35,36,37,41,42]; %計測部分とその近傍
elseif Th1==2
    ch(1:6)                =   [129,7,31,55,80,106];
end
%1.2 Frequency
Freq_max               =   13;
Freq_min               =   9;       %α帯 8-12 Hz
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
r2                  =    randperm(4);
r2buffer            =    zeros(1,4);
mm                  =    0;
mmm                 =    0;
count               =    1;
Refcount            =    1;
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
Jumptrigger         =    0;
% JumpTh              =    25;%←被験者ごとに変更
ERDMax              =    zeros(20,1);
JumpTime            =    zeros(20,50);
%     if Th==2
%         Goal1           =    5;
%         Goal2           =    15;
%     else
%         Goal1           =    25;
%         Goal2           =    35;
%     end
MVC                 =    1000;
RefData             =    zeros(Fs,20);
RefBuffer           =    zeros(1000,61);
TaskBuffer          =    zeros(1000,50,20);
ERDData             =    zeros(20,50);
ERDrawData          =    zeros(20,50);
DataBuffer          =    zeros(11000,20);
sample_NumBuff          =    0;
if exist('SessionCount','var')==0
    SessionCount=1;
end
h=hanning(Fs);