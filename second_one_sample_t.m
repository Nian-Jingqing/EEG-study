clear all

trial_num = 50;
savename = ['tri_',num2str(trial_num),'_one_t.mat']; %%
parent_dir = 'H:\fMRI_data';
cd(parent_dir);

members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
chosen_mem = [1,3,4,9,11,12,14,15,17,18,20,21,22]; %C3 ã«ç›ê´Ç™çÇÇ¢îÌå±é“
members = members(chosen_mem);
% for c = 1:6
%       mkdir(fullfile(parent_dir,'group_analysis_one_sample_t\',['contrast_' num2str(c)]));
%     end
X=1;

for c=1:9
matlabbatch{X}.spm.stats.factorial_design.dir = {fullfile(parent_dir,['group_analysis_one_sample_t_',num2str(trial_num),'_chosen'],['contrast_' num2str(c)])};  %%
%%
for z = 1:size(members,2)
matlabbatch{X}.spm.stats.factorial_design.des.t1.scans{z,1} = fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num)],['con_00' num2str(c,'%02u') '.nii']);
% matlabbatch{X}.spm.stats.factorial_design.des.t2.scans1{1,1} = fullfile(parent_dir,'sub_4/results_representation',['con_00' num2str(c,'%02u') '.img,1']);
% matlabbatch{X}.spm.stats.factorial_design.des.t2.scans2{z,1} = fullfile(parent_dir,members{z},'results_representation',['con_00' num2str(c,'%02u') '.img,1']);
end

% matlabbatch{X}.spm.stats.factorial_design.des.t1.dept = 0;
% matlabbatch{X}.spm.stats.factorial_design.des.t1.variance = 1;
% matlabbatch{X}.spm.stats.factorial_design.des.t2.gmsca = 0;
% matlabbatch{X}.spm.stats.factorial_design.des.t2.ancova = 0;


%%
matlabbatch{X}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{X}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{X}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{X}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{X}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{X}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{X}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{X}.spm.stats.factorial_design.globalm.glonorm = 1;

X = X+1;

end

for c = 1:9
matlabbatch{X}.spm.stats.fmri_est.spmmat = {fullfile(parent_dir,['group_analysis_one_sample_t_',num2str(trial_num),'_chosen'],['contrast_' num2str(c)],'SPM.mat')};
matlabbatch{X}.spm.stats.fmri_est.method.Classical = 1;
    X=X+1;
end

save(savename);

clear all
spm fmri