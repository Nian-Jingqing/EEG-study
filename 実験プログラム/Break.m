if BreakStopper==0 
    set(t,'string','BREAK','color','b');        
    drawnow;
    if Th1==1
        set(tt,'string','Hand','color','c');drawnow;
    elseif Th1==2
        set(tt,'string','Foot','color','c');drawnow;
    elseif Th1==3
        set(tt,'string','Tongue','color','c');drawnow;
    end
    if Th2==2
    set(plot0,'ydata',0,'xdata',0,'color','k');drawnow;
    uistack(plot0,'bottom');
    end
        D.queueOutputData(OutputSignal(4,:));
        D.startBackground(); 
    BreakStopper=1;   
end