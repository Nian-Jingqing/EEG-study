function [ti2] = ListenAmpserver()
ti1 = tcpip('10.10.10.51',9877); %('IPアドレス','ポート番号')
fopen(ti1);
fprintf(ti1,'(sendCommand cmd_Stop 0 0 0)');
fprintf(ti1,'(sendCommand cmd_SetSubjectGround 0 0 1)');
fprintf(ti1,'(sendCommand cmd_Start 0 0 0)'); %Ampからデータを読めるようにする
fclose(ti1);
pause(2); %2秒間停止

ti2 = tcpip('10.10.10.51',9879,'InputBufferSize',1296*1000,'Timeout',60); %InputBuffersize→
fopen(ti2);
fprintf(ti2, '(sendCommand cmd_ListenToAmp 0 0 0)'); %Ampからデータを読み始める
end