if SuccessPoint==1&&SuccessResultStopper==0&&penalty<20
    scrsz = get(groot,'ScreenSize');
    disp3=figure(1000);
%     pos3=[scrsz(3)+1 -200 1950 2356];
    set(gcf,'color',[0 0 0],'position',pos2,'menu','none','toolbar','none');axis off;axis tight;
    im=imread('‘å¬Œ÷4”{.png');
    imshow(im,'InitialMagnification','fit')
    SuccessNum=SuccessNum+1;
    SuccessResultStopper=1;
end
    