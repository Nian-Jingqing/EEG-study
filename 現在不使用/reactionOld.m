% clear all
% close all

% dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
% data_mat = 'subA_cal';
% load([dir,'\',data_mat]); %データ読み取り

dir = ('F:\実験データ\本実験\subA\subA(ERD推移等)'); %フォルダ識別
data_mat = 'subA_1';
load([dir,'\',data_mat]); %データ読み取り
kfind=zeros(20,1);
ERDThData=zeros(2,50);
o=1;
r(2,:)=1;
for i=1:20
    for j=1:50
        if ERDData(i,j)==0
            ERDData(i,j)=NaN;
        end
    end
    k=find(JumpTime(i,:));
    if isempty(k)==1
        kfind(i)=0;
    else
        kfind(i)=k;
    end
    if kfind(i)~=0
        ERDThData(o,:)=ERDData(i,:);
        o=o+1;
    else
        r(2,i)=0;
    end
end

s=find(r(2,:)==0);
r(:,s)=[];
r=r(1,:);

judgesat=ones(o-1,1);
kfind(kfind==0)=NaN;
kfind=kfind(~isnan(kfind));
for i=1:o-1
    for j=1:50
        if ERDThData(i,j)>99
            kfind(i)=0;
            judgesat(i)=0;
        end
    end
end
kfind(kfind>39)=0;
r(find(~kfind))=[];
ERDThData(find(~kfind),:)=[];
kfind(kfind==0)=NaN;
kfind=kfind(~isnan(kfind));




