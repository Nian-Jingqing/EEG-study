if RestStopper2==0
    set(t,'string','REST','color','g');drawnow;
    set(plot0,'ydata',0,'xdata',0);drawnow;
        D.queueOutputData(OutputSignal(4,:));
        D.startBackground();
    RestStopper2=1;
end
