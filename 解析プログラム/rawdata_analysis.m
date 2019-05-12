clear all
close all

Fs          = 1000;
fs          = 200;
TR_num      = 200;
TR_sample   = 3000;

trial_num   = 20;
t_blank1    = 6;
t_rest      = 9;
t_ref       = 9;
t_ready     = 0;
t_task      = 9;
t_blank2    = 0;

roi         = 36;
trial_count = 20;

T               = zeros(2,6);
T(1,:)          = [t_blank1, t_rest, t_ref, t_ready, t_task, t_blank2];
T(2,:)          = [T(1,1), T(1,1)+T(1,2)-T(1,3), T(1,1)+T(1,2), T(1,1)+T(1,2)+T(1,4), ...
    T(1,1)+T(1,2)+T(1,4)+T(1,5), T(1,1)+T(1,2)+T(1,4)+T(1,5)+T(1,6)];
clear t_blank1 t_rest t_ref t_ready t_task t_blank2;

n           = 3;
Band        = [3,95];
notch       = 50;

[BandB,BandA]   = butter(n,Band/(fs/2),'bandpass');
[NotchB,NotchA] = butter(n,[notch-1,notch+1]/(fs/2),'stop');


calc_sample = 0.1 * Fs;

AASnum      = 4;   % number of average artifact subtraction
AASsize     = Fs;
AASinterval = 0.1 * Fs;

OBSnum      = 30;
BCGsize     = 0.8 * Fs;
pcnum       = 4;
ECGsign = 1;

n           = 3;
Band        = [3,95];
notch       = 50;
recordingtag = 3;

freq_fb     = 8:12;  % Hz
fb_min      = -100;  % percent ERS
ch          = 1:129;
ch_num      = 129;
h               = hanning(fs);
H               = repmat(h,[1,ch_num]);
GRAtemp = zeros(AASsize,ch_num+1);
pos3 = [1090 50 600 450];
freq_fb         = freq_fb + 1;

calc_count=11;

dir = ('G:\脳波データ(MATLAB保存)\0911\offline_data'); %フォルダ識別
data_mat = 'ushiba5';
load([dir,'\',data_mat]); %データ読み取り



figure
for i=1:20
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i));
    title(num2str(i));
end

figure
for i=1:20
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i+20));
    title(num2str(i+20));
end

figure
for i=1:20
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i+40));
    title(num2str(i+40));
end

figure
for i=1:20
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i+60));
    title(num2str(i+60));
end

figure
for i=1:20
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i+80));
    title(num2str(i+80));
end

figure
for i=1:20
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i+100));
    title(num2str(i+100));
end

figure
for i=1:9
    subplot(4,5,i)
    plot(1:size(ARwave,1),ARwave(:,i+120));
    title(num2str(i+120));
end

