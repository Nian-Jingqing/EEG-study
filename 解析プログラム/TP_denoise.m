clear all
close all

for j=1:9
dir = ('G:\脳波データ(矢上)\2019年3月'); %フォルダ識別
data_mat = ['fukuda',num2str(j)];
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
dir2 = ('G:\脳波データ(矢上ノイズ除去TF3-9s)');
data_mat2 = ['fukuda',num2str(j),'_denoise'];
load([dir2,'\',data_mat2]);
data=double(data);
% data=data-repmat(mean(data([33 36 45 52 57 58 62 70 75 83 92 96 100 104 108 122],:),1),129,1); %CAR
data=data-repmat(mean(data([129 7 106 31 55 80 6 112 105 87 79 54 37 30 13 12 5 118 111,...
    104 93 86 78 62 61 53 42 36 29 20 11 4 124 117 110 103 98 92 85 77 72 67 60 52 47 41,...
    35 28 24 19 3 123 116 109 102 97 91 84 76 71 66 59 51 46 40 34 27 23 65 64 90 95 70,...
    75 83 69 74 82 89],:),1),129,1); %CAR
Fs=1000;
%α帯%
freq_fb = 9:13;
%バンドパスフィルタ%
Band                   =   [8 13];
Wn                     =   Band/(Fs/2); %passband
[B,A]                  =   butter(3, Wn);
%バンドパスフィルタ2%
Band                   =   [3 70];
Wn                     =   Band/(Fs/2); %passband
[B2,A2]                =   butter(3, Wn);
%ノッチフィルタ%
stopBand               =   [49 51];
stopWn                 =   stopBand/(Fs/2);
[stopB,stopA]          =   butter(3,stopWn,'stop');

trial_num=20;

datacut = data(:,1:cell2mat(evt_255_DINs(4,max(strmatch('DIN4',evt_255_DINs(1,:)))))+EEGSamplingRate*1); %strmatch→一致する文字列検出 録画開始から最後のDIN5まで

% filtdata=filter(stopB,stopA,datacut,[],2);
% filtdata=filter(B2,A2,filtdata,[],2);
filtdata=filtfilt(stopB,stopA,datacut')';
filtdata=filtfilt(B2,A2,filtdata')';


task_start = cell2mat(evt_255_DINs(4,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する

for i = 1:trial_num
    dataY(:,:,i) = filtdata(:,task_start(1,i)-EEGSamplingRate*9:task_start(1,i)+EEGSamplingRate*9-1); %DIN3基準でRest開始からRest2終了までセグメント
end

% save([data_mat,'_seg'],'dataY');

%%%old segmentation%%%
% filtdata=filter(stopB,stopA,data,[],2);
% filtdata=filter(B2,A2,filtdata,[],2);
%
% %evt_255_DINsをdouble型のDINに変換%
% [a1,a2]=size(evt_255_DINs);
% DIN=zeros(4,a2);
% DINstr=evt_255_DINs(1,1:a2);
% for i=1:a2
%     if strcmp(DINstr(i),'DIN1')==1
%         DIN(1,i)=1;
%     elseif strcmp(DINstr(i),'DIN2')==1
%         DIN(1,i)=2;
%     elseif strcmp(DINstr(i),'DIN3')==1
%         DIN(1,i)=3;
%     elseif strcmp(DINstr(i),'DIN4')==1
%         DIN(1,i)=4;
% %     elseif strcmp(DINstr(i),'DIN5')==1
% %         DIN(1,i)=5;
%     end
% end
% DINnum=evt_255_DINs(2:4,1:a2);
% DIN(2:4,1:a2)=cell2mat(DINnum);
%
% %Dataをトライアル分切り出し%
% [b1,b2]=size(DIN);
% dataA=zeros(129,18000,20);
% dataY=zeros(129,18000,20);
% for i=0:b2/4-1
%     k=DIN(4,i*4+1);
%     l=DIN(4,i*4+2);
%     m=DIN(4,i*4+3);
%     n=DIN(4,i*4+4);
% %     o=DIN(4,i*5+5);
%     dataA(:,1:n-k+1,i+1)=data(:,k:n);
%     dataY(:,1:n-k+1,i+1)=filtdata(:,k:n);
% end
%%%

data_all = permute(dataY,[2 1 3]);           % [time ch trial]
rowlength = size(data_all,1);               % data size
data_all = data_all(1:4:rowlength,:,:);     % down sampling 1000Hz -> 250Hz
%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% set prameter %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%

fs = EEGSamplingRate/4;         % sampling rate  1000Hz -> 250Hz
window = EEGSamplingRate/4;       % window size
overlap = 0.9;                  % overlap rate [0 1]
oooverlap = 0.1;                % 1-overlap rate
noverlap = fs*overlap;          % overlapするサンプル数
length = size(data_all,1);      % data length
trial_time = round(length/fs);         % trial time[s]
trial_num = size(data_all,3);   % trial num
window_num = 1+(trial_time-1)/oooverlap;  % window num
ch = size(data_all,2);          % total of channels
fn = fs/length;                 % 基本周波数
wn = [3 100]/(fs/2);            % cut-off frequency
wnrow = [5 70]/(fs/2);
wnalpha = [8 13]/(fs/2);
wnbeta = [14 30]/(fs/2);
wnEMG = [5 450]/(EEGSamplingRate/2);      % cut-off frequency for EMG
t = 1/fs:1/fs:trial_time;       % 1 trial(12sec)data
H = hanning(fs);                % 窓関数 [f,1]
H = repmat(H,[1,ch,trial_num]); % [f,ch,trial]
f_max = 100;                    % 上限周波数
N = 3;                          % order
Ref_start = 31;                 % Referenceの開始の窓番号の設定
Ref_end = 81;                   % Referenceの終了の窓番号の設定
Ref_num = Ref_end-Ref_start+1;  % Referenceの窓数合計
t_starttask = 9;                % Taskの開始時刻
scrsz = get(groot,'Screensize');


%% EEG data にdetrend,BPF+Notchをかける

% for k = 1:1:ch
%     x = squeeze(data_all(:,k,:));
%     data_all(:,k,:) = detrend(x);        % 直流成分を取り除く
% end
%
% % [b,a] = butter(n,wnrow,'bandpass');         % n次、wnrowのカットオフ周波数を持つ band pass filterを設計
% % data_all = filtfilt(b,a,data_all);       % 両側から二次のbandpass filter
%
% [d,c] = butter(n,[99 101]/(fs/2),'stop'); % 100Hz notch filterを設計
% data_all = filtfilt(d,c,data_all);       % BPFをかけた信号に対してNotchをかける
%
% [b,a] = butter(n,wnbeta,'bandpass');         % n次、wn????のカットオフ周波数を持つ band pass filterを設計
% data_foi = filtfilt(b,a,data_all);       % 両側から二次のbandpass filter
%
% data_squaring = data_foi.^2;
%
% data_squaringmean = mean(data_squaring,3);
%
% nnn = 16;    %%% n trial

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% band pass 3-100 Hz %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure(9)   % 生波形の表示 (n trial)
% data_ntrial = data_all(:,:,nnn);
% data_nch = data_ntrial(:,36);
% plot(data_nch);
% set(gcf,'color',[1 1 1]);
% ccc = length;
% set(gca,'xtick',[ccc*1/6,ccc*2/6,ccc*3/6,ccc*4/6,ccc*5/6 ccc],'xticklabel',{'5','10','15','20','25','30'})
% xlim([0 7500]); ylim([-15 15]); ylabel('Amplitude [μV]');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% band pass ???? Hz %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% figure(10)   % 生波形の表示 (n trial)
% data_ntrial = data_foi(:,:,nnn);
% data_nch = data_ntrial(:,36);
% plot(data_nch);
% set(gcf,'color',[1 1 1]);
% ccc = length;
% set(gca,'xtick',[ccc*1/6,ccc*2/6,ccc*3/6,ccc*4/6,ccc*5/6 ccc],'xticklabel',{'5','10','15','20','25','30'})
% xlim([0 7500]); ylim([-8 8]); ylabel('Amplitude [μV]');

%%%%%%%%%%%%%%%%%%%%
%%%%% squaring %%%%%
%%%%%%%%%%%%%%%%%%%%

% figure(11)
% data_ntrial = data_squaring(:,:,nnn);
% data_nch = data_ntrial(:,36);
% plot(data_nch);
% set(gcf,'color',[1 1 1]);
% ccc = length;
% set(gca,'xtick',[ccc*1/6,ccc*2/6,ccc*3/6,ccc*4/6,ccc*5/6 ccc],'xticklabel',{'5','10','15','20','25','30'})
% xlim([0 7500]); ylim([0 15]); ylabel('Amplitude [μV]');

%%%%%%%%%%%%%%%%%%%%%
%%%%% averaging %%%%%
%%%%%%%%%%%%%%%%%%%%%

% figure(12)
% data_nch = data_squaringmean(:,36);
% plot(data_nch);
% set(gcf,'color',[1 1 1]);
% ccc = length;
% set(gca,'xtick',[ccc*1/6,ccc*2/6,ccc*3/6,ccc*4/6,ccc*5/6 ccc],'xticklabel',{'5','10','15','20','25','30'})
% xlim([0 7500]); ylim([0 8]); ylabel('Amplitude [μV]');

%% パワー、ERPの計算

data_fft = zeros(fs,ch,trial_num);
power = zeros(fs,window_num,ch,trial_num);  % [f window ch trial]

for i = 1:1:window_num
    s = (i-1)*fs*oooverlap+1;            % 切り出す窓の最初の数を指定
    g = s+fs-1;                          % 切り出す窓の最後の数を指定
    data = data_all(s:g,:,:);
    data_fft = fft(data.*H)/fs*2*2;
    power(:,i,:,:) = 2*((abs(data_fft).^2)/(fs*fs));
end

%%%%% ERDを4次元で計算 %%%%%
ref = power(:,Ref_start:Ref_end,:,:); %referenceにする窓の切り出し
ref_mean = mean(ref,2);
Ref = repmat(ref_mean,[1,window_num,1,1]); 
% power1=power(:,:,:,1:10);
% Ref1=Ref(:,:,:,1:10);
% power2=power(:,:,:,11:20);
% Ref2=Ref(:,:,:,11:20);
ERP = (Ref-power)./Ref*100;  % [f window ch trial]

%%%%% 品質チェック　figure(10) %%%%%
% ERP_36 = squeeze(ERP(:,:,36,:));
% ERP_36 = squeeze(mean(ERP_36,3));
% ERP_36 = ERP_36(12:14,:);
% ERP_36 = mean(ERP_36,1);
% ERP_36 = ERP_36.';
% figure(10)
% plot(1:window_num,ERP_36);

%%%%% n chのパワースペクトルを表示 figure(20) %%%%%
% power_alltrial = mean(power,4); % [f window ch]
% power_nch = power_alltrial(:,:,36); % [f window]
% temp_power = power_nch(19:23,:);
% power_nchalpha = mean(temp_power,1);
% figure(20)
% plot(1:window_num,power_nchalpha);
% xlabel('window')
% ylabel('PSD[μV^2]')
% line([21 21],ylim,'color','b','LineWidth',1,'Linestyle','-');
% line([71 71],ylim,'color','b','LineWidth',1,'Linestyle','-');
% line([91 91],ylim,'color','r','LineWidth',1,'Linestyle','-');


%% Figure(100) Topography mapの描画

run('ChannnelLocation.m');
% ERP_eachtrial = permute(ER2,[1 3 2 4]); %[f window ch trial]
temp_each = ERP(:,91:171,:,:); %[f window ch trial]
ERP_mean_each = squeeze(mean(temp_each,2)); %[f ch trial]
temp_alpha_each = ERP_mean_each(freq_fb,:,:); %[f ch trial]
ERP_alpha_each = squeeze(mean(temp_alpha_each,1)); %[ch trial]

figure(j+20); clf(gcf); set(gcf,'position',[1920 0 1680 970]);
for i=1:trial_num
    subplot(4,5,i);
    topography(ERP_alpha_each(:,i),loc,3);
    c=jet;
    c=flipud(c);
    colormap(c);
    c=colorbar;
    c.Label.String='ERD,%';
    caxis([-100 100]);
    title([num2str(freq_fb(1)-1),'-',num2str(freq_fb(end)-1),' Hz']);
    set(gca,'FontSize',16,'FontName','Helvetica')
end



%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% for gradually %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

% seg = 6;    % Rest or Task OR gradually
% ccc = 11;  % 1秒当たりの窓数
% nnn = window_num/seg; % 各segの窓数
%
% for i = 1:seg-3
% range = [round(ccc*1+nnn*i)+1 round(ccc*4+nnn*i)];  % 各segが5秒の時
ERP_denoise = ERP(:,:,:,denoise_trial);
ERP_alltrial = mean(ERP,4); 
temp = ERP_alltrial(:,91:171,:);        % range幅のERPを抜き出す　[f window ch]
ERP_mean = squeeze(mean(temp,2));     % trial、時間方向の平均を計算する [f ch]
temp2 = ERP_mean(freq_fb,:);   % FOI
ERP_foi = mean(temp2,1);
ERP_foi = ERP_foi.';

save([data_mat,'_denoise'],'ERP_foi');
clear -regexp ^fukuda
end
