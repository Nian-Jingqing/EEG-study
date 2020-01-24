clear all

savename = ['second_design_covarietes_1231.mat']; %%

parent_dir = 'D:\NHK2016\analysis_3';
cd(parent_dir);

% sub_name  ={'sub_4','sub_3','sub_5','sub_7','sub_8','sub_11','sub_13','sub_14','sub_15','sub_16','sub_17','sub_18','sub_19','sub_2','sub_6','sub_21','sub_22'};
sub_name  ={'KATO','NAGAI','FUKUOKA','HARA','FUJIMOTO','FUJIMON','TSUDUKI','KIDA','HOSODA','NAKAMURA','HIROSE','HIRATA','TAKAHASHI'};


sub_leg = [0,1,1,1,0,1,0,1,1,1,1,0,0,1,0,0,1];
image_num=[4,5,6,1,2,3,8,7,10,9,12,11];

covarietes = [1 0 0 0 0 0 0 0 0 0 0 0 0];

for c = 1:6
      mkdir(fullfile(parent_dir,'group_analysis_covarietes_lr\',['contrast_' num2str(c)]));
end
X=1;

fol_name ={'PPI_R_knee_hip_L_M1','PPI_L_knee_hip_R_M1'};

for c=1:6
matlabbatch{X}.spm.stats.factorial_design.dir = {fullfile(parent_dir,'group_analysis_covarietes_lr',['contrast_' num2str(c)])};  %%
%%
% for z = 1:size(sub_name,2)
% % if sub_leg(z) ==0
% % matlabbatch{X}.spm.stats.factorial_design.des.t1.scans{z,1} = fullfile(parent_dir,sub_name{z},fol_name{1},['con_00' num2str(c,'%02u') '.nii,1']);
% % else    
% % matlabbatch{X}.spm.stats.factorial_design.des.t1.scans{z,1} = fullfile(parent_dir,sub_name{z},fol_name{2},['con_00' num2str(c,'%02u') 'lr.nii,1']);    
% % % matlabbatch{X}.spm.stats.factorial_design.des.t1.scans{z,1} = fullfile(parent_dir,sub_name{z},fol_name{2},['con_00' num2str(image_num(c),'%02u') 'lr.nii,1']);    
% % end
% end

for z = 1:size(sub_name,2)
matlabbatch{X}.spm.stats.factorial_design.des.t1.scans{z,1} = fullfile(parent_dir,sub_name{z},'results_representation',['con_00' num2str(c,'%02u') '.nii,1']);
end

%%
matlabbatch{X}.spm.stats.factorial_design.cov.c = covarietes;
matlabbatch{X}.spm.stats.factorial_design.cov.cname = 'group';
matlabbatch{X}.spm.stats.factorial_design.cov.iCFI = 1;
matlabbatch{X}.spm.stats.factorial_design.cov.iCC = 1;
% matlabbatch{X}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
% matlabbatch{X}.spm.stats.factorial_design.multi_cov.files = {'D:\NHK2016\multi_cov.txt'};
% matlabbatch{X}.spm.stats.factorial_design.multi_cov.iCFI = 1;
% matlabbatch{X}.spm.stats.factorial_design.multi_cov.iCC = 1;
matlabbatch{X}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{X}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{X}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{X}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{X}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{X}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{X}.spm.stats.factorial_design.globalm.glonorm = 1;

X = X+1;

end

for c = 1:6
matlabbatch{X}.spm.stats.fmri_est.spmmat = {fullfile(parent_dir,'group_analysis_covarietes_lr\',['contrast_' num2str(c)],'SPM.mat')};
matlabbatch{X}.spm.stats.fmri_est.method.Classical = 1;
    X=X+1;
end

save(savename);

clear all
spm fmri