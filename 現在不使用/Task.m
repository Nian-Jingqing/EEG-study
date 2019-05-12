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

EMG_Signal = Buffer(1:Buffer_FreshRate,136);

tSignal(NumOfStim+1,:)=Signal;
    
EMG_Signal = detrend(EMG_Signal,'constant');
    
Signalfilt=filter(B,A,Signal);
TempTask_EMG=filter(EMGB,EMGA,TempTask_EMG);
TempTask_EMG=abs(TempTask_EMG); 
%  SignalPoint=Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(4))...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(1))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(2))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(3))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(5))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(6))/6 ...
%             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(7))/6;
%  SignalfiltBuff=zeros(1:sample_Num);
% for i=1:sample_Num
%     SignalfiltBuff(i)=0.000003756837606782689*SignalPoint(i)-0.00001127051282034807*Signal(Buffer_FreshRate-1)+0.00001127051282034807*Signal(Buffer_FreshRate-3)-0.000003756837606782689*Signal(Buffer_FreshRate-5)...
%         +5.924985610441010*Signalfilt(Buffer_FreshRate)-14.639628682960698*Signalfilt(Buffer_FreshRate-1)+19.308012885480338*Signalfilt(Buffer_FreshRate-2)-14.336182264168297*Signalfilt(Buffer_FreshRate-3)+5.681911324514184*Signalfilt(Buffer_FreshRate-4)-0.939098940325281*Signalfilt(Buffer_FreshRate-5);
%     Signal(2:Buffer_FreshRate)=Signal(1:Buffer_FreshRate-1);
%     Signal(Buffer_FreshRate)=SignalPoint(i);
%     Signalfilt(2:Buffer_FreshRate)=Signalfilt(1:Buffer_FreshRate-1);
%     Signalfilt(Buffer_FreshRate)=SignalfiltBuff(i);
% end
absSignalfilt=abs(Signalfilt);
Value=mean(absSignalfilt(end-87:end));
PD=Threshold-Value;
ERD=PD/Threshold*100;
set(plot0,'ydata',ERD,'xdata',0);drawnow;

if ERD>=Goal(1)&&PD<=Goal(2)
      SuccessCount=SuccessCount+1;
      if SuccessCount>=7
          SuccessPoint=1;
      end
else
      SuccessCount=0;
end
