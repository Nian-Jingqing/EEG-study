clear all
close all

dir = ('F:\�����f�[�^\�{����\subD\subD(ERD���ړ�)'); %�t�H���_����
data_mat = 'subD_10';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

kfind=zeros(20,1);
ERDThData=zeros(2,50);
ERDThrawData=zeros(2,50);
o=1;

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
        ERDThrawData(o,:)=ERDData(i,:);
        o=o+1;
    end
end

judgesat=ones(o-1,1);
kfind(kfind==0)=NaN;
kfind=kfind(~isnan(kfind));
for i=1:o-1
    for j=1:50
        if ERDThrawData(i,j)>99
            kfind(i)=0;
            judgesat(i)=0;
        end
    end
end
kfind(kfind==0)=NaN;
kfind=kfind(~isnan(kfind));

subD_t10=kfind;

save('subD_Timing','subD_t1','subD_t10');

