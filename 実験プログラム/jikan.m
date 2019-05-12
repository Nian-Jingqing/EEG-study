figure(1000)
pos2=[640 0 640 800];
set(gcf,'menu','none','toolbar','none','position',pos2,'color',[0 0 0])
plot0   =   plot(0,0,'w.','MarkerSize',50);
axis tight;axis off;
xlim([-1 1]);ylim([-1 1]);
ti=0.25;
tic
toc
while toc<1000
    if mod(toc,ti*2)>ti
        set(plot0,'ydata',0,'xdata',0,'color','k');drawnow;
    elseif mod(toc,ti*2)<ti
        set(plot0,'ydata',0,'xdata',0,'color','w');drawnow;
    end
end



