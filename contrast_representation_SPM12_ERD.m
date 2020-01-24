clear all

%% settings

parent_dir = 'H:\fMRI_data'; %ƒtƒHƒ‹ƒ_
cd(parent_dir);

members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
sess_name  = {'correlation_with','correlation_without','correlation_MI','correlation_with_all','correlation_without_all','correlation_MI_all'};

X =1;
trial_num = 50;
savename = ['tri_',num2str(trial_num),'_ERD_cr.mat'];
for z = 1:size(members,2)
    
    if z<strmatch('nakamura',members)
        index = xlsread('contrast_representation_ERD');
    elseif z>=strmatch('nakamura',members)
        index = xlsread('contrast_representation2_ERD');
    end
    
    if trial_num == 50
        if z==12 || z==15
            index = index(:,[1:2,5:60]);
        elseif z==11 || z==18
            index = index(:,[1:12,15:60]);
        elseif z==4
            index = index(:,[1:22,25:60]);
        elseif z==3 || z==20 || z==24
            index = index(:,[1:32,35:60]);
        elseif z==14
            index = index(:,[1:12,15:22,25:32,35:60]);
        end
    end
    
    matlabbatch{X}.spm.stats.con.spmmat = {fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num),'_ERD'] ,'/SPM.mat')};
    for con = 1:size(index,1);
        matlabbatch{X}.spm.stats.con.consess{con}.tcon.name = sess_name{con};
        matlabbatch{X}.spm.stats.con.consess{con}.tcon.weights = index(con,:);
        matlabbatch{X}.spm.stats.con.consess{con}.tcon.sessrep = 'none';
    end
    
    matlabbatch{X}.spm.stats.con.delete = 1;
    
    X = X + 1;
end

save(savename);

clear all
spm fmri


