if count_sample>=precount_sample+100 %%100/Fs‚²‚Æ‚ÉERD‚ÌŒvŽZ‚ªs‚í‚ê‚é
    if TaskStopper==0
        set(t,'string','    ','color','r');drawnow;
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
    TaskBuffer(:,ERDcount,trial_count)=TempTaskFFTPower;
    
    ERD=(TempTaskFFTPower-Ref)./Ref*100;
    ERD=mean(ERD(Freq_min:Freq_max,1));
    EMG = mean(TempTask_EMG(end-99:end,1));
    ERDrawData(trial_count,ERDcount)=-ERD;
    %% Moving Average
    y_lim_max=100;
    Mov(1:10)    =   [Mov(2:10),max([min(100,ERD),-100])];
    MovAve      =   mean(Mov(1:10));
    Value       =   max([min(100,MovAve),-100]);
    ValueValue(1)=ValueValue(2);
    ValueValue(2)=-Value;
    if Th~=3
        if count_sample>7000&&count_sample<10000
            if Jumptrigger==0
                %         if (ValueValue(2)>JumpTh && ValueValue(1)<JumpTh) || (ValueValue(2)<JumpTh && ValueValue(1)>JumpTh)
                if ValueValue(2)>JumpTh && ValueValue(1)<JumpTh
                    Jumptrigger=1;
                    JumpTime(trial_count,ERDcount)=1;
                    mm=mm+1;
                    if mm>4
                        r2buffer(mmm*4+1:mmm*4+4)=r2;
                        mmm=mmm+1;
                        r2=randperm(4);
                        mm=1;
                    end
                    clampcount=count_sample;
                end
            end
        end
    end
    %{
    if Th==5
        if r(trial_count)==5
          Value=Value-10;
        end
    end
    %}
    ERDData(trial_count,ERDcount)=-Value;
    if Jumptrigger==1
        if Th==1
            if count_sample-clampcount<1000
                if r2(mm)==3
                    %                 if r(trial_count)>=11&&r(trial_count)<=15
                    set(plot0,'ydata',JumpERD,'xdata',0);drawnow;
                elseif r2(mm)==4
                    %                 elseif r(trial_count)>=16&&r(trial_count)<=20
                    set(plot0,'ydata',0,'xdata',0);drawnow;
                else
                    if Value<=0
                        set(plot0,'ydata',min(max(-Value,-20),ERDGoal+10),'xdata',0);drawnow;
                    elseif Value>0
                        set(plot0,'ydata',min(max(-log10(1+Value)*10,-20),ERDGoal+10),'xdata',0);drawnow;
                    end
                end
            else
                if Value<=0
                    set(plot0,'ydata',min(max(-Value,-20),ERDGoal+10),'xdata',0);drawnow;
                    
                elseif Value>0
                    set(plot0,'ydata',min(max(-log10(1+Value)*10,-20),ERDGoal+10),'xdata',0);drawnow;
                end
            end
        elseif Th==2
            if r(trial_count)>=11&&r(trial_count)<=15
                if Value+JumpERD<=0
                    set(plot0,'ydata',min(max(-Value-JumpERD,-20),ERDGoal+10),'xdata',0,'color','r');drawnow;
                elseif Value+JumpERD>0
                    set(plot0,'ydata',min(max(-log10(1+(Value+JumpERD))*10,-20),ERDGoal+10),'xdata',0,'color','r');drawnow;
                end
            elseif r(trial_count)>=16&&r(trial_count)<=20
                if Value+JumpTh<=0
                    set(plot0,'ydata',min(max(-Value-JumpTh,-20),ERDGoal+10),'xdata',0,'color','b');drawnow;
                elseif Value+JumpERD>0
                    set(plot0,'ydata',min(max(-log10(1+(Value+JumpTh))*10,-20),ERDGoal+10),'xdata',0,'color','b');drawnow;
                end
            else
                if Value<=0
                    set(plot0,'ydata',min(max(-Value,-20),ERDGoal+10),'xdata',0);drawnow;
                    
                elseif Value>0
                    set(plot0,'ydata',min(max(-log10(1+Value)*10,-20),ERDGoal+10),'xdata',0);drawnow;
                end
            end
        end
    else
        if Th==3
            if Value<=0
                set(plot0,'ydata',min(max(-Value,-20),100),'xdata',0);drawnow;
                
            elseif Value>0
                set(plot0,'ydata',min(max(-log10(1+Value)*10,-20),100),'xdata',0);drawnow;
            end
        else
            if Value<=0
                set(plot0,'ydata',min(max(-Value,-20),ERDGoal+10),'xdata',0);drawnow;
                
            elseif Value>0
                set(plot0,'ydata',min(max(-log10(1+Value)*10,-20),ERDGoal+10),'xdata',0);drawnow;
            end
        end
    end
    %{
    if EMG>=MVC*0.2
        set(t2,'string','weaken muscle!','color','y');drawnow;
        penalty=penalty+1;
    else
        set(t2,'string','     ','color','y');drawnow;
    end
    %}
    %{
   if Th~=1
    if -Value>Goal1&&-Value<=Goal2
       SuccessCount=SuccessCount+1;
      if SuccessCount>=5
          SuccessPoint=1;
      end
    else
          SuccessCount=0;
    end
   elseif Th == 1
       if mod(r(trial_count),2) == 0
          if -Value>25&&-Value<=35
             SuccessCount=SuccessCount+1;
             if SuccessCount>=5
                  SuccessPoint=1;
             end
          else
             SuccessCount=0;
          end
       else
          if -Value>5&&-Value<=15
             SuccessCount=SuccessCount+1;
             if SuccessCount>=5
                SuccessPoint=1;
             end
          else
              SuccessCount=0;
          end
       end
   end
    %}
    ERDcount=ERDcount+1;
    precount_sample=count_sample;
end