if RestStopper==0
    TempNum1=num2str(trial_count);
    TempNum2=strcat('REST     ',TempNum1);
    set(t,'string',TempNum2,'color','g');drawnow;
    if Th2==2
    set(plot0,'ydata',0,'xdata',0,'color','w');
    uistack(plot0,'top');drawnow;
    end
        D.queueOutputData(OutputSignal(1,:));
        D.startBackground();
    RestStopper=1;
end
