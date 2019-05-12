clear all
close all

for j=1:10
dir = ('G:\脳波データ(矢上)\2019年1月'); %フォルダ識別
data_mat = ['kiriyama',num2str(j)];
load([dir,'\',data_mat]); %データ読み取り
temp = whos('*mff');
eval(['data = ',temp(1).name,';']);
dir2 = ('G:\脳波データ(矢上ノイズ除去TF)');
data_mat2 = ['kiriyama',num2str(j),'_denoise'];
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

filtdata=filtfilt(stopB,stopA,datacut')';
filtdata=filtfilt(B2,A2,filtdata')';


task_start = cell2mat(evt_255_DINs(4,strmatch('DIN3',evt_255_DINs(1,:)))); %DIN3の位置だけを検出する

for i = 1:trial_num
    dataY(:,:,i) = filtdata(:,task_start(1,i)+EEGSamplingRate*2:task_start(1,i)+EEGSamplingRate*7-1); %DIN3基準でRest開始からRest2終了までセグメント
end

% save([data_mat,'_seg'],'dataY');

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
Ref_start = 1;                 % Referenceの開始の窓番号の設定
Ref_end = 81;                   % Referenceの終了の窓番号の設定
Ref_num = Ref_end-Ref_start+1;  % Referenceの窓数合計
t_starttask = 9;                % Taskの開始時刻
scrsz = get(groot,'Screensize');


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

for trial_count=1:20
    for ch=1:129
        for Seg=1:fs:length
            Fxx=Fxx+power(:,

clear -regexp ^kiriyama
end
