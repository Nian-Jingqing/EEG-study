if count_sample>=precount_sample+100
if RestStopper==0
    TempNum1=num2str(trial_count);
    TempNum2=strcat('REST     ',TempNum1);
    set(t,'string',TempNum2,'color','g');drawnow;
    set(plot0,'ydata',0,'xdata',0);drawnow;
        D.queueOutputData(OutputSignal(1,:));
        D.startBackground();
    RestStopper=1;
end
Signal = Buffer(1:Buffer_FreshRate,ch(4))...
            -Buffer(1:Buffer_FreshRate,ch(1))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(2))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(3))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(5))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(6))/6 ...
            -Buffer(1:Buffer_FreshRate,ch(7))/6;

EMG_Signal = Buffer(1:Buffer_FreshRate,136);

tSignal(NumOfStim+1,:)=Signal;
    
EMG_Signal = detrend(EMG_Signal,'constant');
    
Signalfilt=filter(B,A,Signal);
TempTask_EMG=filter(EMGB,EMGA,EMG_Signal);
TempTask_EMG=abs(TempTask_EMG); 
% SignalPoint=Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(4))...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(1))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(2))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(3))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(5))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(6))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(7))/6;
% SignalfiltBuff=zeros(1:sample_Num);
% for i=1:sample_Num
%     SignalfiltBuff(i)=0.000003756837606782689*SignalPoint(i)-0.00001127051282034807*Signal(Buffer_FreshRate-1)+0.00001127051282034807*Signal(Buffer_FreshRate-3)-0.000003756837606782689*Signal(Buffer_FreshRate-5)...
%         +5.924985610441010*Signalfilt(Buffer_FreshRate)-14.639628682960698*Signalfilt(Buffer_FreshRate-1)+19.308012885480338*Signalfilt(Buffer_FreshRate-2)-14.336182264168297*Signalfilt(Buffer_FreshRate-3)+5.681911324514184*Signalfilt(Buffer_FreshRate-4)-0.939098940325281*Signalfilt(Buffer_FreshRate-5);
%     Signal(1:Buffer_FreshRate-1)=Signal(2:Buffer_FreshRate);
%     Signal(Buffer_FreshRate)=SignalPoint(i);
%     Signalfilt(1:Buffer_FreshRate-1)=Signalfilt(2:Buffer_FreshRate);
%     Signalfilt(Buffer_FreshRate)=SignalfiltBuff(i);
% end
absSignalfilt=abs(Signalfilt);
Value=mean(absSignalfilt(end-87:end));
PD=Threshold-Value;
ERD=PD/Threshold*100;
set(plot0,'ydata',ERD,'xdata',0);drawnow;
ValueValue(2)=ValueValue(1);
ValueValue(1)=ERD;
if ValueValue(2)~=0
    if (ValueValue(1)>0&&ValueValue(2)<0)||(ValueValue(1)<0&&ValueValue(2)>0)
        RCStopper=1;
    end
end
 precount_sample=count_sample;
end