%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Main program

%%set parameter is for Netstation Cz
Th1=get(UITh1,'Value'); %ThÇÕUIThÇÃëIëéàÇÃÉâÉxÉãïtÇØ
Th2=get(UITh2,'Value');
SetParameterNew;
SetNI; %DINÇÃê›íË
GetData_Parameter;
ti2         =       ListenAmpserver;
BufferStopper = 0;
while(recordingtag == 0)
    if trial_count < 21
        GetData_NA400ver164;
        %         DataBuffer(1+sample_NumBuff:sample_NumBuff+sample_Num,trial_count)=Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(4))...
        %                                                                             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(1))/6 ...
        %                                                                             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(2))/6 ...
        %                                                                             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(3))/6 ...
        %                                                                             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(5))/6 ...
        %                                                                             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(6))/6 ...
        %                                                                             -Buffer(Buffer_FreshRate-sample_Num+1:Buffer_FreshRate,ch(7))/6;
        %         sample_NumBuff=sample_NumBuff+sample_Num;
        if Th2==2
            if count_sample>0&&count_sample<8001
                Rest;
            end
            if count_sample>2000&&count_sample<8001
                Reference;
            end
            if count_sample>8000&&count_sample<9001
                RefCalculate;
                Ready;
            end
            if count_sample>9000&&count_sample<18001
                TaskPre;
            end
            if count_sample>18000&&count_sample<21001
                Break;
            end
            if count_sample>21000
                ResetTrial;
                trial_count=trial_count+1;
            end
        elseif Th2==1
            if count_sample>0&&count_sample<8001
                Rest;
            end
            if count_sample>8000&&count_sample<9001
                Ready;
            end
            if count_sample>9000&&count_sample<18001
                TaskPre;
            end
            if count_sample>18000&&count_sample<21001
                Break;
            end
            if count_sample>21000
                ResetTrial;
                trial_count=trial_count+1;
            end
        end
    else
        %             name = clock;
        %             name = [num2str(name(1)),num2str(name(2)),num2str(name(3)),num2str(name(4)),num2str(name(5))];
        %         if Th == 1||Th == 2
        %             r2buffer(mmm*4+1:mmm*4+4)=r2;
        %             r2buffer=r2buffer(1:end-(4-mm));
        %             save(['umehara_',num2str(SessionCount-1)],'r2buffer','RefData','ERDData','ERDrawData','JumpTime','TaskBuffer')
        %         elseif Th==3
        %             for i=1:20
        %                 for j=1:50
        %                     if ERDData(i,j)==0
        %                         ERDData(i,j)=NaN;
        %                     end
        %                 end
        %             end
        %             for i=1:20
        %                 ERDMax(i)=max(ERDData(i,:));
        %             end
        %             ERDGoal=mean(ERDMax([1:2,4:6,8:20]))*1.5;
        %             JumpTh=ERDGoal*0.5;
        %             JumpERD=JumpTh*0.5;
        %             save('umehara_cal','RefData','ERDData','ERDMax','ERDGoal','JumpTh','JumpERD','TaskBuffer');
        %             %             elseif Th == 2||Th == 3
        %             %                save(['Training',TempNum-2,'data_',name],'Ref','ERDData','SuccessNum')
        %         end
        break;
    end
end

% if Th~=3
close figure 100
fclose(ti2);
% end


% save(['test',num2str(SessionCount)],'Ref','ERDData');
SessionCount    =   SessionCount+1;
TempNum         =   num2str(SessionCount);
TempNum2        =   strcat('Session ',TempNum);
set(UISession,'string',TempNum2);
stop(D);
