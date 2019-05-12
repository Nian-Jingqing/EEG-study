D.queueOutputData(OutputSignal(5,:));
D.startBackground();
stop(D);

% ti2 = ListenAmpserver;

set(t,'string','Go','color','r');drawnow;
tic;
D.queueOutputData(OutputSignal(1,:));
D.startBackground();
stop(D);

%% Main 

% while count_sample < 3 * Sampling_Rate
%     GetData_NA400ver164;
% end

while count_sample < 3 * Sampling_Rate
    GetData_NA400ver164;
end
set(t,'string','Relax','color','g');drawnow;
toc;

D.queueOutputData(OutputSignal(7,:));
% D.queueOutputData(OutputSignal(2,:));
D.startBackground();
stop(D);
 
fclose(ti2);

%%% filter %%%
EMG = Buffer(1:Buffer_FreshRate,:);
EMG = detrend(EMG,'linear');
EMG = filter(EMGB,EMGA,EMG);
EMG = filter(stopB,stopA,EMG);    % 50 Hz
EMG = filter(stopB2,stopA2,EMG);  % 100 Hz
EMG = filter(stopB3,stopA3,EMG);  % 150 Hz
EMG = filter(stopB4,stopA4,EMG);
EMG = filter(stopB5,stopA5,EMG);
%% calculate MVC

getch = 130;
EMG_getch = abs(EMG(:,getch)); % EMG ch

windowEMG = 300;
length = 100;   % 100ms
windowEMG_num = (Buffer_FreshRate-windowEMG)/length+1;
EMG_mean = zeros(windowEMG_num,1);
for i = 1:windowEMG_num
    s = (i-1)*length+1;
    g = s+windowEMG-1;
    EMG_temp = EMG_getch(s:g,:);
    EMG_mean(i) = mean(EMG_temp,1);
end

figure(77)
plot(EMG_mean);
% ylim([0 500]);

% EMG_temp2 = EMG_getch(2001:4000,:);
MVC = max(EMG_mean);