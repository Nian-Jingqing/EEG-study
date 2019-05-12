clear all
close all

dir = ('F:\�����f�[�^\�{����\subA\subA(ERD���ړ�)'); %�t�H���_����
data_mat = 'subA_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subB\subB(ERD���ړ�)'); %�t�H���_����
data_mat = 'subB_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subC\subC(ERD���ړ�)'); %�t�H���_����
data_mat = 'subC_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subD\subD(ERD���ړ�)'); %�t�H���_����
data_mat = 'subD_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subE\subE(ERD���ړ�)'); %�t�H���_����
data_mat = 'subE_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subF\subF(ERD���ړ�)'); %�t�H���_����
data_mat = 'subF_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subG\subG(ERD���ړ�)'); %�t�H���_����
data_mat = 'subG_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subH\subH(ERD���ړ�)'); %�t�H���_����
data_mat = 'subH_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subI\subI(ERD���ړ�)'); %�t�H���_����
data_mat = 'subI_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subJ\subJ(ERD���ړ�)'); %�t�H���_����
data_mat = 'subJ_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subK\subK(ERD���ړ�)'); %�t�H���_����
data_mat = 'subK_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subL\subL(ERD���ړ�)'); %�t�H���_����
data_mat = 'subL_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

dir = ('F:\�����f�[�^\�{����\subM\subM(ERD���ړ�)'); %�t�H���_����
data_mat = 'subM_gradient2';
load([dir,'\',data_mat]); %�f�[�^�ǂݎ��

h1=[median(subA_Gradient_h1),median(subB_Gradient_h1),median(subC_Gradient_h1),median(subD_Gradient_h1),median(subE_Gradient_h1),median(subF_Gradient_h1),median(subG_Gradient_h1),median(subH_Gradient_h1),median(subI_Gradient_h1),median(subJ_Gradient_h1),median(subK_Gradient_h1),median(subL_Gradient_h1),median(subM_Gradient_h1)];

z1=[median(subA_Gradient_z1),median(subB_Gradient_z1),median(subC_Gradient_z1),median(subD_Gradient_z1),median(subE_Gradient_z1),median(subF_Gradient_z1),median(subG_Gradient_z1),median(subH_Gradient_z1),median(subI_Gradient_z1),median(subJ_Gradient_z1),median(subK_Gradient_z1),median(subL_Gradient_z1),median(subM_Gradient_z1)];

h2=[median(subA_Gradient_h2),median(subB_Gradient_h2),median(subC_Gradient_h2),median(subD_Gradient_h2),median(subE_Gradient_h2),median(subF_Gradient_h2),median(subG_Gradient_h2),median(subH_Gradient_h2),median(subI_Gradient_h2),median(subJ_Gradient_h2),median(subK_Gradient_h2),median(subL_Gradient_h2),median(subM_Gradient_h2)];

z2=[median(subA_Gradient_z2),median(subB_Gradient_z2),median(subC_Gradient_z2),median(subD_Gradient_z2),median(subE_Gradient_z2),median(subF_Gradient_z2),median(subG_Gradient_z2),median(subH_Gradient_z2),median(subI_Gradient_z2),median(subJ_Gradient_z2),median(subK_Gradient_z2),median(subL_Gradient_z2),median(subM_Gradient_z2)];

subA_Gradient_hall=[subA_Gradient_h1 subA_Gradient_h2];
subA_Gradient_zall=[subA_Gradient_z1 subA_Gradient_z2];
subB_Gradient_hall=[subB_Gradient_h1 subB_Gradient_h2];
subB_Gradient_zall=[subB_Gradient_z1 subB_Gradient_z2];
subC_Gradient_hall=[subC_Gradient_h1 subC_Gradient_h2];
subC_Gradient_zall=[subC_Gradient_z1 subC_Gradient_z2];
subD_Gradient_hall=[subD_Gradient_h1 subD_Gradient_h2];
subD_Gradient_zall=[subD_Gradient_z1 subD_Gradient_z2];
subE_Gradient_hall=[subE_Gradient_h1 subE_Gradient_h2];
subE_Gradient_zall=[subE_Gradient_z1 subE_Gradient_z2];
subF_Gradient_hall=[subF_Gradient_h1 subF_Gradient_h2];
subF_Gradient_zall=[subF_Gradient_z1 subF_Gradient_z2];
subG_Gradient_hall=[subG_Gradient_h1 subG_Gradient_h2];
subG_Gradient_zall=[subG_Gradient_z1 subG_Gradient_z2];
subH_Gradient_hall=[subH_Gradient_h1 subH_Gradient_h2];
subH_Gradient_zall=[subH_Gradient_z1 subH_Gradient_z2];
subI_Gradient_hall=[subI_Gradient_h1 subI_Gradient_h2];
subI_Gradient_zall=[subI_Gradient_z1 subI_Gradient_z2];
subJ_Gradient_hall=[subJ_Gradient_h1 subJ_Gradient_h2];
subJ_Gradient_zall=[subJ_Gradient_z1 subJ_Gradient_z2];
subK_Gradient_hall=[subK_Gradient_h1 subK_Gradient_h2];
subK_Gradient_zall=[subK_Gradient_z1 subK_Gradient_z2];
subL_Gradient_hall=[subL_Gradient_h1 subL_Gradient_h2];
subL_Gradient_zall=[subL_Gradient_z1 subL_Gradient_z2];
subM_Gradient_hall=[subM_Gradient_h1 subM_Gradient_h2];
subM_Gradient_zall=[subM_Gradient_z1 subM_Gradient_z2];

hall=[median(subA_Gradient_hall),median(subB_Gradient_hall),median(subC_Gradient_hall),median(subD_Gradient_hall),median(subE_Gradient_hall),median(subF_Gradient_hall),median(subG_Gradient_hall),median(subH_Gradient_hall),median(subI_Gradient_hall),median(subJ_Gradient_hall),median(subK_Gradient_hall),median(subL_Gradient_hall),median(subM_Gradient_hall)];

zall=[median(subA_Gradient_zall),median(subB_Gradient_zall),median(subC_Gradient_zall),median(subD_Gradient_zall),median(subE_Gradient_zall),median(subF_Gradient_zall),median(subG_Gradient_zall),median(subH_Gradient_zall),median(subI_Gradient_zall),median(subJ_Gradient_zall),median(subK_Gradient_zall),median(subL_Gradient_zall),median(subM_Gradient_zall)];

figure
subplot(2,3,1)
plot(1,h1,'o')
hold on
plot(2,z1,'o')
for i=1:13
plot([1,2],[h1(i),z1(i)],'-o')
end
xlim([0 3])
ylim([0 0.2])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'���W�����v�O��','��W�����v�O��'}));
set(gca,'FontSize',12)
ylabel('Gradient')
title('��s����� �e�팱�҂̒����l��r')
[p_1,h_1]=signrank(h1,z1);


subplot(2,3,2)
plot(1,h2,'o')
hold on
plot(2,z2,'o')
for i=1:13
plot([1,2],[h2(i),z2(i)],'-o')
end
xlim([0 3])
ylim([0 0.2])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'���W�����v�㔼','��W�����v�㔼'}));
set(gca,'FontSize',12)
ylabel('Gradient')
title('��s����� �e�팱�҂̒����l��r')
[p_2,h_2]=signrank(h2,z2);

subplot(2,3,3)
plot(1,h1,'o')
hold on
plot(2,h2,'o')
for i=1:13
plot([1,2],[h1(i),h2(i)],'-o')
end
xlim([0 3])
ylim([0 0.2])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'���W�����v�O��','���W�����v�㔼'}));
set(gca,'FontSize',12)
ylabel('Gradient')
title('��s����� �e�팱�҂̒����l��r')
[p_3,h_3]=signrank(h1,h2);

subplot(2,3,4)
plot(1,z1,'o')
hold on
plot(2,z2,'o')
for i=1:13
plot([1,2],[z1(i),z2(i)],'-o')
end
xlim([0 3])
ylim([0 0.2])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'��W�����v�O��','��W�����v�㔼'}));
set(gca,'FontSize',12)
ylabel('Gradient')
title('��s����� �e�팱�҂̒����l��r')
[p_4,h_4]=signrank(z1,z2);

subplot(2,3,5)
plot(1,hall,'o')
hold on
plot(2,zall,'o')
for i=1:13
plot([1,2],[hall(i),zall(i)],'-o')
end
xlim([0 3])
ylim([0 0.2])
set(gca,'XTick',([1;2]));
set(gca,'XTickLabel',({'���W�����v����','��W�����v����'}));
set(gca,'FontSize',12)
ylabel('Gradient')
title('��s����� �e�팱�҂̒����l��r')
[p_5,h_5]=signrank(hall,zall);