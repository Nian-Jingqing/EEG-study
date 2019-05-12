if count_sample>=precount_sample+100
    % Signal=eSample(:,ch(4))-eSample(:,ch(1))/6-eSample(:,ch(2))/6-eSample(:,ch(3))/6-eSample(:,ch(5))/6-eSample(:,ch(6))/6-eSample(:,ch(7))/6;
    % Signal=eSample(:,129)-sum(eSample(:,ch),2)/length(ch);
    if Th1==1
        Signal = Buffer(1:Buffer_FreshRate,ch(4))...
            -Buffer(1:Buffer_FreshRate,ch(1))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(2))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(3))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(5))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(6))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(7))/6;
    elseif Th1==2
        Signal = Buffer(1:Buffer_FreshRate,ch(1))...
            -Buffer(1:Buffer_FreshRate,ch(2))/5 ...
            -Buffer(1:Buffer_FreshRate,ch(3))/5 ...
            -Buffer(1:Buffer_FreshRate,ch(4))/5 ...
            -Buffer(1:Buffer_FreshRate,ch(5))/5 ...
            -Buffer(1:Buffer_FreshRate,ch(6))/5;
    end
    
    
    % Signal=detrend(Signal,'linear');
    % TempRef = filter(B,A,Signal);
    % TempRef = filter(stopB,stopA,TempRef);
    % TempRefFFTPower=zeros(Fs,(length(TempRef)/Fs-1)*10+1);
    Signal=detrend(Signal,'linear');
    EMG_Signal = Buffer(1:Buffer_FreshRate,130);
    EMG_Signal = detrend(EMG_Signal,'constant');
    
    TempRef=filter(stopB,stopA,Signal(Fs+1:end,1));
    TempRef=filter(B,A,TempRef);
    TempRef_EMG = filter(EMGB,EMGA,EMG_Signal(Fs+1:end,1));
    TempRef_EMG = filter(stopB,stopA,TempRef_EMG);    % 50 Hz
    TempRef_EMG = filter(stopB2,stopA2,TempRef_EMG);  % 100 Hz
    TempRef_EMG = filter(stopB3,stopA3,TempRef_EMG);  % 150 Hz
    TempRef_EMG = filter(stopB4,stopA4,TempRef_EMG);  % 200 Hz
    TempRef_EMG = filter(stopB5,stopA5,TempRef_EMG);  % 250 Hz
    
    % TempRef_EMG=abs(TempRef_EMG);
    % AveEMG = mean(TempTask_EMG);
    % SD     = std(TempTask_EMG);
    % EMGRef = AveEMG+SD*3;
    
    TempRef=TempRef.*h;
    TempRefFFT=fft(TempRef);
    TempRefFFTPower=abs(TempRefFFT).^2;
    
    % EMG_Signal = Buffer(1:Buffer_FreshRate,130);
    % refSignal(NumOfStim+1,:)=Signal;
    % EMG_Signal = detrend(EMG_Signal,'linear');
    % TempTask_EMG = filter(stopB,stopA,EMG_Signal); %filtfilt=ゼロ位相デジタルフィルター処理
    % TempTask_EMG = filter(EMGB,EMGA,TempTask_EMG);
    % TempTask_EMG = filter(stopB2,stopA2,TempTask_EMG);  % 100 Hz
    % TempTask_EMG = filter(stopB3,stopA3,TempTask_EMG);  % 150 Hz
    % TempTask_EMG = filter(stopB4,stopA4,TempTask_EMG);  % 200 Hz
    % TempTask_EMG = filter(stopB5,stopA5,TempTask_EMG);
    % TempTask_EMG=abs(TempTask_EMG);
    % AveEMG = mean(TempTask_EMG);
    % SD     = std(TempTask_EMG);
    % EMGRef = AveEMG+SD*3;
    
    % for i=1:1:(length(TempRef)/Fs-1)*10+1
    %     f=100*(i-1)+1;
    %     e=f+999;
    %     Temp=TempRef(f:e,1);
    %     Temp=Temp.*h;
    %     Temp=fft(Temp);
    %     Temp=abs(Temp).^2;
    %     TempRefFFTPower(:,i)=Temp;
    % end
    RefBuffer(:,Refcount)=TempRefFFTPower;
    Refcount=Refcount+1;
    % TempRefFFTPower=mean(TempRefFFTPower,2);
    % Ref(:,trial_count)=TempRefFFTPower;
    precount_sample=count_sample;
end