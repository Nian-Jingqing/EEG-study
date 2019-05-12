%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Main program

%%set parameter is for Netstation Cz
Th=get(UITh,'Value'); %ThはUIThの選択肢のラベル付け
SetParameterNew;
SetNI; %DINの設定
GetData_Parameter;
ti2         =       ListenAmpserver;
BufferStopper = 0;
while(recordingtag == 0)
    if Th==1
        if trial_count<21
            GetData_NA400ver164;
            if count_sample>0&&count_sample<4001
                Break;
            end
            if count_sample>4000&&count_sample<5001
                Ready;
            end
            if count_sample>5000&&count_sample<10001
                TaskRelax;
            end
            if count_sample > 10000
                ResetTrial; %ここでcount_sampleが0になる。
                trial_count=trial_count+1;
            end
        else
            Break;
            Calibration;
            break;
        end
    elseif Th==2||Th==3 ||Th==4 ||Th==5
        if trial_count < 21 
            GetData_NA400ver164;
        if count_sample>0&&count_sample<5001
             if Th == 2
                if mod(r(trial_count),2) == 0
                  set(Goal,'position',[-140 45 280 10])
                else
                  set(Goal,'position',[-140 5 280 10])
                end
             end
             Rest;

        end
        if count_sample>4950&&count_sample<5001
            Reference;
        end
        if count_sample>5000&&count_sample<6001
            Ready;
        end
        if count_sample>6000&&count_sample<11001
            TaskMain;   
        end
        if count_sample>11000&&count_sample<16001
            Rest2;
        end
        if count_sample>16000&&count_sample<21001
            SuccessResult;
            if SuccessPoint==1&&penalty<20
                if count_sample>19001
                    Closer;
                end
            end
            Break;
        end
        if count_sample>21000
            ResetTrial;
            trial_count=trial_count+1;
        end
        else
            name = clock;
            name = [num2str(name(1)),num2str(name(2)),num2str(name(3)),num2str(name(4)),num2str(name(5))];
            if Th == 2
               save(['Testdata_',name],'r','Ref','ERDData','SuccessNum')
            elseif Th == 3
               save(['Training',TempNum,'data_',name],'Ref','ERDData','SuccessNum')
            end
            break;
        end
    elseif Th==6
        if trial_count < 11 
            GetData_NA400ver164;
        if count_sample>1&&count_sample<5001
            Rest;
        end
        if count_sample>4950&&count_sample<5001
            Reference;
        end
        if count_sample>5000&&count_sample<6001
            Ready;
        end
        if count_sample>6000&&count_sample<12001
            Task2;   
        end
        if count_sample>12000 && count_sample<17001
            Break;
        end
        if count_sample>17000
                ResetTrial;
                trial_count=trial_count+1;
        end
        else
            break;
        end
    elseif Th==7||Th==8
        if trial_count < 11 
            GetData_NA400ver164;
        if count_sample>0&&count_sample<5001
            Rest;
        end
        if count_sample>4950&&count_sample<5001
            Reference;
        end
        if count_sample>5000&&count_sample<6001
            Ready;
        end
        if count_sample>6000&&count_sample<11001
            Task2;   
        end
        if count_sample>11000&&count_sample<16001
            Rest2;
        end
        if count_sample>16000&&count_sample<21001
            SuccessResult;
            if SuccessPoint==1&&penalty<20
                if count_sample>19001
                    Closer;
                end
            end
            Break;
        end
        if count_sample>21000
            ResetTrial;
            trial_count=trial_count+1;
        end
        else
            break;
        end
    elseif Th==9
        CalculateMVC;
        break;
    end
end

% close figure 10 
if Th~=1&&Th~=9
    close figure 100
end

if Th~=9
fclose(ti2);
end

% save(['test',num2str(SessionCount)],'Ref','ERDData');
SessionCount    =   SessionCount+1;
TempNum         =   num2str(SessionCount);
TempNum2        =   strcat('Session ',TempNum);
set(UISession,'string',TempNum2);
stop(D);


