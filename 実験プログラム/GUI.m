clear variables
close all

scrsz   = get(0,'ScreenSize');
figure('position',[300,scrsz(4)-900,900,350],'name','GUI','menu','none','toolbar','none') %�T�C�Y�ɍ������X�N���[���p��
UI1         = uicontrol(gcf,'Style','Push','Position',[0 30 300 100],...
            'String','Start','FontSize',20,'CallBack','recordingtag = 0;BCI2'); %�X�^�[�g�{�^���A�X�N���v�g'BCI'���N��
UI2         = uicontrol(gcf,'Style','Push','Position',[300 30 300 100],...
            'string','Stop','FontSize',20,'CallBack','recordingtag = 1;fprintf(ti2, ''(sendCommand cmd_StopListeningToAmp 0 0 0)'');'); %�X�g�b�v�{�^���AAmp����f�[�^�ǂݏo���J�n(ListenAmpserver.m�Q��)
UISession   =uicontrol(gcf,'Style','Text','Position',[100 300 300 50],...
            'string','Session1','FontSize',40,'BackGroundColor',[0.8 0.8 0.8]); %�D�F�̕���
UITh1        =uicontrol(gcf,'Style','listbox','Position',[100 150 300 100],...  
            'string','Hand|Foot|Tongue','FontSize',20,'BackGroundColor',[0.8 0.8 0.8]); %���j���[�����\��
UITh2        =uicontrol(gcf,'Style','listbox','Position',[500 150 300 100],...  
            'string','Execution|Imagery','FontSize',20,'BackGroundColor',[0.8 0.8 0.8]); %���j���[�����\��
UIClose     =uicontrol(gcf,'Style','Push','Position',[600 30 300 100],...sess
            'string','Close','FontSize',20,'CallBack','CCCCLOSE'); %�N���[�Y�{�^���A�X�N���v�g'CCCCLOSE'���N��(close,clear)
