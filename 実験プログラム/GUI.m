clear variables
close all

scrsz   = get(0,'ScreenSize');
figure('position',[300,scrsz(4)-900,900,350],'name','GUI','menu','none','toolbar','none') %サイズに合ったスクリーン用意
UI1         = uicontrol(gcf,'Style','Push','Position',[0 30 300 100],...
            'String','Start','FontSize',20,'CallBack','recordingtag = 0;BCI2'); %スタートボタン、スクリプト'BCI'を起動
UI2         = uicontrol(gcf,'Style','Push','Position',[300 30 300 100],...
            'string','Stop','FontSize',20,'CallBack','recordingtag = 1;fprintf(ti2, ''(sendCommand cmd_StopListeningToAmp 0 0 0)'');'); %ストップボタン、Ampからデータ読み出し開始(ListenAmpserver.m参照)
UISession   =uicontrol(gcf,'Style','Text','Position',[100 300 300 50],...
            'string','Session1','FontSize',40,'BackGroundColor',[0.8 0.8 0.8]); %灰色の部分
UITh1        =uicontrol(gcf,'Style','listbox','Position',[100 150 300 100],...  
            'string','Hand|Foot|Tongue','FontSize',20,'BackGroundColor',[0.8 0.8 0.8]); %メニュー部分表示
UITh2        =uicontrol(gcf,'Style','listbox','Position',[500 150 300 100],...  
            'string','Execution|Imagery','FontSize',20,'BackGroundColor',[0.8 0.8 0.8]); %メニュー部分表示
UIClose     =uicontrol(gcf,'Style','Push','Position',[600 30 300 100],...sess
            'string','Close','FontSize',20,'CallBack','CCCCLOSE'); %クローズボタン、スクリプト'CCCCLOSE'を起動(close,clear)
