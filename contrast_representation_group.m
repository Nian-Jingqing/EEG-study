clear all

%% settings
parent_dir = 'H:\fMRI_data'; %ƒtƒHƒ‹ƒ_
cd(parent_dir);

sess_name  = {'with_good','without_good','with_good-without_good','without_good-with_good','MI_good','MI_bad','with_good-with_bad','without_good-without_bad','MI_good-MI_bad'};
% sess_name  = {'correlation_with','correlation_without','correlation_MI','correlation_with_all','correlation_without_all','correlation_MI_all'};

X =1;
trial_num = 30;

savename = ['tri_',num2str(trial_num),'_cr_group'];
for con = 1:size(sess_name,2);
    matlabbatch{X}.spm.stats.con.spmmat = {fullfile(parent_dir,['group_analysis_one_sample_t_',num2str(trial_num)],['contrast_',num2str(con)] ,'/SPM.mat')};
    matlabbatch{X}.spm.stats.con.consess{1}.tcon.name = sess_name{con};
    matlabbatch{X}.spm.stats.con.consess{1}.tcon.weights = double(1);
    matlabbatch{X}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
    matlabbatch{X}.spm.stats.con.delete = 1;
    X = X+1;
end

save(savename);

clear all
spm fmri


