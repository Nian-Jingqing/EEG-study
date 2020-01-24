%%marsbarÇäJÇ≠

parent_dir = 'H:\fMRI_data';
cd(parent_dir)

% roi_name = {'L_M1_ankle_roi','L_M1_knee_roi','L_M1_hip_roi','R_M1_ankle_roi','R_M1_knee_roi','R_M1_hip_roi'}; %êÊÇ…çÏÇ¡ÇƒÇ®Ç≠ÅB

sub_name  ={'KATO','NAGAI','FUKUOKA','TSUDUKI','FUJIMOTO','FUJIMON','HIROSE','HOSODA'};

for r = 1:size(roi_name,2)
roi_files = [parent_dir '\' roi_name{r} '.mat'];

for sub = 1:size(sub_name,2)
 cd(parent_dir)
 spm_name = [parent_dir, '\', sub_name{sub},'\results_representation\SPM.mat'];
     
 des_path = spm_name;
 rois = maroi('load_cell', roi_files); % make maroi ROI objects
 des = mardo(des_path);  % make mardo design object
 mY = get_marsy(rois{:}, des, 'mean'); % extract data into marsy data object
 y  = summary_data(mY);  % get summary time course(s)
 
 cd('D:\NHK2016\analysis_3\VOI') %% 
 save([sub_name{sub} '_' roi_name{r} '.mat'],'y');
end
end

