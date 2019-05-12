%%
close all;
clear all;

SetNI;
GetData_Parameter;

D.queueOutputData(OutputSignal(10,:));
D.startBackground();
stop(D);

ti2 = ListenAmpserver;
tic;
D.queueOutputData(OutputSignal(1,:));
D.startBackground();
stop(D);
%% Main 

while count_sample < 5 * Sampling_Rate
    GetData_NA400ver164;
end
toc;
D.queueOutputData(OutputSignal(2,:));
D.startBackground();
stop(D);
 
fclose(ti2);

[bandB,bandA] = butter(3,[5 500]/Sampling_Rate);
[stopB,stopA] = butter(3,[49 51]/Sampling_Rate,'stop');

eeg = filtfilt(bandB,bandA,Buffer(1:Buffer_FreshRate,:));
eeg = filtfilt(stopB,stopA,eeg);

figure;
% for EEGi = 1:1:10
%     subplot(10,1,EEGi)
%     plot(1:Buffer_FreshRate,eeg(1:Buffer_FreshRate,EEGi+120));
%     hold on
% end

plot(1:Buffer_FreshRate,eeg(1:Buffer_FreshRate,136));
