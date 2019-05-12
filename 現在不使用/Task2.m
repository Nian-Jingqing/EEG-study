if count_sample>=precount_sample+100 %%100/Fs‚²‚Æ‚ÉERD‚ÌŒvŽZ‚ªs‚í‚ê‚é
    if TaskStopper==0
        set(t,'string','IMAGE!','color','r');drawnow;
        D.queueOutputData(OutputSignal(3,:));
        D.startBackground();   
        TaskStopper=1;
    end
    Signal = Buffer(1:Buffer_FreshRate,ch(4))...
            -Buffer(1:Buffer_FreshRate,ch(1))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(2))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(3))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(5))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(6))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(7))/6;
    
    Signal=detrend(Signal,'linear');
    EMG_Signal = Buffer(1:Buffer_FreshRate,130);
    
    EMG_Signal = detrend(EMG_Signal,'constant');
    
    TempTask=filter(stopB,stopA,Signal(Fs+1:end,1));
    TempTask=filter(B,A,TempTask);
    TempTask_EMG = filter(EMGB,EMGA,EMG_Signal(Fs+1:end,1));
    TempTask_EMG = filter(stopB,stopA,TempTask_EMG);    % 50 Hz
    TempTask_EMG = filter(stopB2,stopA2,TempTask_EMG);  % 100 Hz
    TempTask_EMG = filter(stopB3,stopA3,TempTask_EMG);  % 150 Hz
    TempTask_EMG = filter(stopB4,stopA4,TempTask_EMG);  % 200 Hz
    TempTask_EMG = filter(stopB5,stopA5,TempTask_EMG);  % 250 Hz

    TempTask_EMG=abs(TempTask_EMG); 
    
    TempTask=TempTask.*h;
    TempTaskFFT=fft(TempTask);
    TempTaskFFTPower=abs(TempTaskFFT).^2;   
      
    ERD=(TempTaskFFTPower-TempRefFFTPower)./TempRefFFTPower*100;
    ERD=mean(ERD(Freq_min:Freq_max,1));
    EMG = mean(TempTask_EMG(end-99:end,1));

%% Moving Average
    y_lim_max=100;
    Mov(1:9)    =   Mov(2:10);
    Mov(10)=max(min(100,ERD),-100);
    MovAve      =   mean(Mov(1:10));

    Value       =   max(min(100,MovAve),-100);
    set(plot0,'ydata',max(-Value,0),'xdata',0);drawnow;
    if EMG>=MVC*0.2
        set(t2,'string','weaken muscle!','color','y');drawnow;
        penalty=penalty+1;
    else
        set(t2,'string','     ','color','y');drawnow;
    end
    if -Value>=Goal3
      SuccessCount=SuccessCount+1;
      if SuccessCount>=5
          SuccessPoint=1;
      end
    end
    
    precount_sample=count_sample;
end
