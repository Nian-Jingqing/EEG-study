clear all

%% settings
parent_dir = 'H:\fMRI_data'; %ƒtƒHƒ‹ƒ_
cd(parent_dir);

members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
sess_name  = {'with_good','without_good','with_good-without_good','without_good-with_good','MI_good','MI_bad','with_good-with_bad','without_good-without_bad','MI_good-MI_bad'};

X =1;
trial_num = 50;

savename = ['tri_',num2str(trial_num),'_cr'];

for z = 1:size(members,2)
    if z<strmatch('nakamura',members)
        index = xlsread('contrast_representation');
    elseif z>=strmatch('nakamura',members)
        index = xlsread('contrast_representation2');
    end
    
    if trial_num == 50
        if z==12 || z==15
            index = index(:,[1,3:48]);
        elseif z==11 || z==18
            index = index(:,[1:9,11:48]);
        elseif z==4
            index = index(:,[1:17,19:48]);
        elseif z==3 || z==20 || z==24
            index = index(:,[1:25,27:48]);
        elseif z==14
            index = index(:,[1:9,11:17,19:25,27:48]);
        end
    end
    
    matlabbatch{X}.spm.stats.con.spmmat = {fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num)] ,'/SPM.mat')};
    
    for con = 1:size(index,1);
        matlabbatch{X}.spm.stats.con.consess{con}.tcon.name = sess_name{con};
        matlabbatch{X}.spm.stats.con.consess{con}.tcon.weights = index(con,:);
        matlabbatch{X}.spm.stats.con.consess{con}.tcon.sessrep = 'none';
    end
    
%     matlabbatch{X}.spm.stats.con.consess{size(sess_name,2)+1}.fcon.name = 'Effects of Interest';
%     matlabbatch{X}.spm.stats.con.consess{size(sess_name,2)+1}.fcon.weights = [1    0     0     0     0    0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%         0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%         0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%         0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%         0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     1     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0;...
%         0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0    0     0     0     0     0     0     0     0     0     0     0     1     0     0     0     0     0     0     0];
    
    matlabbatch{X}.spm.stats.con.delete = 1;
    
    X = X + 1;
end

save(savename);

clear all
spm fmri


