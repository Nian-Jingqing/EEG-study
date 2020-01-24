clear all

parent_dir = 'H:\fMRI_data'; %フォルダ
cd(parent_dir);

members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
task_onset=[6 14 22 30 38 46 54 62 70 78 86 94 102 110 118 126 134 142 150 158];
sess_name  = {'session1','session2','session3','session4','session5','session6'};


%%
X = 1;
trial_num = 30;

savename = ['tri_',num2str(trial_num),'_dfp'];

for z = 1:size(members,2)
% for z = 1;
    
    dir = ('H:\ERDsort');
    data_mat = [members{z},'_gt_',num2str(trial_num)];
    load([dir,'\',data_mat]); %データ読み取り
    
    %     for h = 1:size(sess_name,2);
    h=1;
    
    %  scan parameter
    matlabbatch{X}.spm.stats.fmri_spec.dir = {fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num)])};  %%
    matlabbatch{X}.spm.stats.fmri_spec.timing.units = 'scans';
    matlabbatch{X}.spm.stats.fmri_spec.timing.RT = 3;    %%
    matlabbatch{X}.spm.stats.fmri_spec.timing.fmri_t = 30; %%
    matlabbatch{X}.spm.stats.fmri_spec.timing.fmri_t0   = 15; %%
    
    %      for session = 1:6
    
    %% 1 session
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %%
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_with_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,FirstSession_with_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_with_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,FirstSession_with_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_without_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', 'with_ERD', 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,FirstSession_without_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', 'with_ERD', 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_without_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,FirstSession_without_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 2 session
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_without_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,FirstSession_without_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_without_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,FirstSession_without_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_with_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,FirstSession_with_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_with_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,FirstSession_with_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 3 session
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_with_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,SecondSession_with_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_with_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,SecondSession_with_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_without_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,SecondSession_without_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_without_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,SecondSession_without_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 4 session
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end

    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_without_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,SecondSession_without_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_without_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,SecondSession_without_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_with_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,SecondSession_with_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_with_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,SecondSession_with_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 5 session
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    

    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_with_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,ThirdSession_with_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_with_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,ThirdSession_with_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
        
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_without_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,ThirdSession_without_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_without_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,ThirdSession_without_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 6 session
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end

    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_without_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,ThirdSession_without_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_without_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,ThirdSession_without_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_with_MR;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(task_onset,ThirdSession_with_MR);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 3;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_with_MR;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(task_onset,ThirdSession_with_MR);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 3;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    
    matlabbatch{X}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
    matlabbatch{X}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
    matlabbatch{X}.spm.stats.fmri_spec.volt = 1;
    matlabbatch{X}.spm.stats.fmri_spec.global = 'None';
    matlabbatch{X}.spm.stats.fmri_spec.mthresh = 0.8;
    matlabbatch{X}.spm.stats.fmri_spec.mask = {''};
    matlabbatch{X}.spm.stats.fmri_spec.cvi = 'AR(1)';
    X = X+1;
end

for z = 1:size(members,2)
    matlabbatch{X}.spm.stats.fmri_est.spmmat = {fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num),'_MI'] ,'/SPM.mat')};  %%
    matlabbatch{X}.spm.stats.fmri_est.method.Classical = 1;
    X=X+1;
end

save(savename);

clear all
spm fmri

    