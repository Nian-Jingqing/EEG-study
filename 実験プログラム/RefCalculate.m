if RCStopper==0
%     for i=1:1000
%        for j=1:Refcount
%            if RefBuffer(i,j)==0
%                RefBuffer(i,j)=NaN;
%            end
%        end
%     end
    Ref=mean(RefBuffer,2,'omitnan');
    RefData(:,trial_count)=Ref;
    RCStopper=1;
end