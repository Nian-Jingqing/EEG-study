clear all



parent_dir = 'H:\fMRI_data'; %フォルダ
cd(parent_dir);

members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};

sess_name  = {'session1','session2','session3','session4','session5','session6'};

trial_num = 50;
savename = ['tri_',num2str(trial_num),'_ERD_dfp'];

%%
X = 1;

for z = 1:size(members,2)
    
    dir = ('H:\ERDsort');
    data_mat = [members{z},'_gn_',num2str(trial_num)];
    load([dir,'\',data_mat]); %データ読み取り
    
    
    dir = ('H:\ERDsort');
    data_mat = [members{z},'_gt_',num2str(trial_num)];
    load([dir,'\',data_mat]); %データ読み取り
    
    
    dir = ('H:\脳波データ(ERD-3sec)');
    data_mat = [members{z},'_ERD3s'];
    load([dir,'\',data_mat]); %データ読み取り
    
    %%TaskOnset for ERD(duration = 1)
    for i=1:size(FirstSession_with)
        FirstSession_with_ERD(3*i-2) = FirstSession_with(i)*3-2;
        FirstSession_with_ERD(3*i-1) = FirstSession_with(i)*3-1;
        FirstSession_with_ERD(3*i) = FirstSession_with(i)*3;
        FirstSession_with_MR_ERD(3*i-2) = FirstSession_with_MR(i);
        FirstSession_with_MR_ERD(3*i-1) = FirstSession_with_MR(i)+1;
        FirstSession_with_MR_ERD(3*i) = FirstSession_with_MR(i)+2;
    end
    
    for i=1:size(FirstSession_without)
        FirstSession_without_ERD(3*i-2) = FirstSession_without(i)*3-2;
        FirstSession_without_ERD(3*i-1) = FirstSession_without(i)*3-1;
        FirstSession_without_ERD(3*i) = FirstSession_without(i)*3;
        FirstSession_without_MR_ERD(3*i-2) = FirstSession_without_MR(i);
        FirstSession_without_MR_ERD(3*i-1) = FirstSession_without_MR(i)+1;
        FirstSession_without_MR_ERD(3*i) = FirstSession_without_MR(i)+2;
    end
    
    for i=1:size(SecondSession_with)
        SecondSession_with_ERD(3*i-2) = SecondSession_with(i)*3-2;
        SecondSession_with_ERD(3*i-1) = SecondSession_with(i)*3-1;
        SecondSession_with_ERD(3*i) = SecondSession_with(i)*3;
        SecondSession_with_MR_ERD(3*i-2) = SecondSession_with_MR(i);
        SecondSession_with_MR_ERD(3*i-1) = SecondSession_with_MR(i)+1;
        SecondSession_with_MR_ERD(3*i) = SecondSession_with_MR(i)+2;
    end
    
    for i=1:size(SecondSession_without)
        SecondSession_without_ERD(3*i-2) = SecondSession_without(i)*3-2;
        SecondSession_without_ERD(3*i-1) = SecondSession_without(i)*3-1;
        SecondSession_without_ERD(3*i) = SecondSession_without(i)*3;
        SecondSession_without_MR_ERD(3*i-2) = SecondSession_without_MR(i);
        SecondSession_without_MR_ERD(3*i-1) = SecondSession_without_MR(i)+1;
        SecondSession_without_MR_ERD(3*i) = SecondSession_without_MR(i)+2;
    end
    
    for i=1:size(ThirdSession_with)
        ThirdSession_with_ERD(3*i-2) = ThirdSession_with(i)*3-2;
        ThirdSession_with_ERD(3*i-1) = ThirdSession_with(i)*3-1;
        ThirdSession_with_ERD(3*i) = ThirdSession_with(i)*3;
        ThirdSession_with_MR_ERD(3*i-2) = ThirdSession_with_MR(i);
        ThirdSession_with_MR_ERD(3*i-1) = ThirdSession_with_MR(i)+1;
        ThirdSession_with_MR_ERD(3*i) = ThirdSession_with_MR(i)+2;
    end
    
    for i=1:size(ThirdSession_without)
        ThirdSession_without_ERD(3*i-2) = ThirdSession_without(i)*3-2;
        ThirdSession_without_ERD(3*i-1) = ThirdSession_without(i)*3-1;
        ThirdSession_without_ERD(3*i) = ThirdSession_without(i)*3;
        ThirdSession_without_MR_ERD(3*i-2) = ThirdSession_without_MR(i);
        ThirdSession_without_MR_ERD(3*i-1) = ThirdSession_without_MR(i)+1;
        ThirdSession_without_MR_ERD(3*i) = ThirdSession_without_MR(i)+2;
    end
    
    
    %  scan parameter
    matlabbatch{X}.spm.stats.fmri_spec.dir = {fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num),'_ERD'])};  %%
    matlabbatch{X}.spm.stats.fmri_spec.timing.units = 'scans';
    matlabbatch{X}.spm.stats.fmri_spec.timing.RT = 3;    %%
    matlabbatch{X}.spm.stats.fmri_spec.timing.fmri_t = 30; %%
    matlabbatch{X}.spm.stats.fmri_spec.timing.fmri_t0   = 15; %%
    
    %      for session = 1:6
    
    %% 1 session
    h=1;
    %     if z==strmatch('kida',members)
    %         TaskOnset=1:19;
    %         for i=1:19
    %             TaskOnset_MR(3*i-2) = 6+(i-1)*8;
    %             TaskOnset_MR(3*i-1) = 7+(i-1)*8;
    %             TaskOnset_MR(3*i) = 8+(i-1)*8;
    %         end;
    %     else
    TaskOnset=1:60;
    for i=1:20
        TaskOnset_MR(3*i-2) = 6+(i-1)*8;
        TaskOnset_MR(3*i-1) = 7+(i-1)*8;
        TaskOnset_MR(3*i) = 8+(i-1)*8;
    end;
    %     end
    
    
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %%
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_with_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'with_ERD_good', 'param', ERD_3s_with(FirstSession_with_ERD,1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,FirstSession_with_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'with_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,FirstSession_with_ERD),1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_goad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_with_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_with(FirstSession_with_ERD,1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,FirstSession_with_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,FirstSession_with_ERD),1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
        
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_without_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'without_ERD_good', 'param', ERD_3s_without(FirstSession_without_ERD,1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,FirstSession_without_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'without_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,FirstSession_without_ERD),1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_without_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_without(FirstSession_without_ERD,1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,FirstSession_without_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,FirstSession_without_ERD),1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 2 session
    TaskOnset=1:60;
    for i=1:20
        TaskOnset_MR(3*i-2) = 6+(i-1)*8;
        TaskOnset_MR(3*i-1) = 7+(i-1)*8;
        TaskOnset_MR(3*i) = 8+(i-1)*8;
    end;
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_without_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'without_ERD_good', 'param', ERD_3s_without(FirstSession_without_ERD,1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,FirstSession_without_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'without_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,FirstSession_without_ERD),1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_without_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_without(FirstSession_without_ERD,1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,FirstSession_without_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,FirstSession_without_ERD),1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = FirstSession_with_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'with_ERD_good', 'param', ERD_3s_with(FirstSession_with_ERD,1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,FirstSession_with_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'with_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,FirstSession_with_ERD),1), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = FirstSession_with_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_with(FirstSession_with_ERD,1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,FirstSession_with_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,FirstSession_with_ERD),1), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 3 session
    TaskOnset=1:60;
    for i=1:20
        TaskOnset_MR(3*i-2) = 6+(i-1)*8;
        TaskOnset_MR(3*i-1) = 7+(i-1)*8;
        TaskOnset_MR(3*i) = 8+(i-1)*8;
    end;
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_with_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'with_ERD_good', 'param', ERD_3s_with(SecondSession_with_ERD,2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,SecondSession_with_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'with_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,SecondSession_with_ERD),2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_with_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_with(SecondSession_with_ERD,2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,SecondSession_with_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,SecondSession_with_ERD),2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
        
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_without_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'without_ERD_good', 'param', ERD_3s_without(SecondSession_without_ERD,2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,SecondSession_without_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'without_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,SecondSession_without_ERD),2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_without_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_without(SecondSession_without_ERD,2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,SecondSession_without_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,SecondSession_without_ERD),2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 4 session
    TaskOnset=1:60;
    for i=1:20
        TaskOnset_MR(3*i-2) = 6+(i-1)*8;
        TaskOnset_MR(3*i-1) = 7+(i-1)*8;
        TaskOnset_MR(3*i) = 8+(i-1)*8;
    end;
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_without_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'without_ERD_good', 'param', ERD_3s_without(SecondSession_without_ERD,2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,SecondSession_without_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'without_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,SecondSession_without_ERD),2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_without_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_without(SecondSession_without_ERD,2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,SecondSession_without_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,SecondSession_without_ERD),2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
        
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = SecondSession_with_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'with_ERD_good', 'param', ERD_3s_with(SecondSession_with_ERD,2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,SecondSession_with_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'with_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,SecondSession_with_ERD),2), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = SecondSession_with_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_with(SecondSession_with_ERD,2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,SecondSession_with_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,SecondSession_with_ERD),2), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 5 session
    TaskOnset=1:60;
    for i=1:20
        TaskOnset_MR(3*i-2) = 6+(i-1)*8;
        TaskOnset_MR(3*i-1) = 7+(i-1)*8;
        TaskOnset_MR(3*i) = 8+(i-1)*8;
    end;
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_with_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'with_ERD_good', 'param', ERD_3s_with(ThirdSession_with_ERD,3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,ThirdSession_with_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'with_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,ThirdSession_with_ERD),3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_with_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_with(ThirdSession_with_ERD,3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,ThirdSession_with_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,ThirdSession_with_ERD),3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
        
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_without_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'without_ERD_good', 'param', ERD_3s_without(ThirdSession_without_ERD,3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,ThirdSession_without_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'without_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,ThirdSession_without_ERD),3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_without_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_without(ThirdSession_without_ERD,3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,ThirdSession_without_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,ThirdSession_without_ERD),3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
    end
    
    
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi = {''};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).regress = struct('name', {}, 'val', {});
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).multi_reg = {fullfile(parent_dir,members{z},sess_name{h},'rp_0001.txt')};
    matlabbatch{X}.spm.stats.fmri_spec.sess(h).hpf = 128;
    
    h = h+1;
    %% 6 session
    %     if z==strmatch('kida',members)||z==strmatch('hirose',members)
    %         TaskOnset=1:19;
    %         for i=1:19
    %             TaskOnset_MR(3*i-2) = 6+(i-1)*8;
    %             TaskOnset_MR(3*i-1) = 7+(i-1)*8;
    %             TaskOnset_MR(3*i) = 8+(i-1)*8;
    %         end;
    %     else
    TaskOnset=1:60;
    for i=1:20
        TaskOnset_MR(3*i-2) = 6+(i-1)*8;
        TaskOnset_MR(3*i-1) = 7+(i-1)*8;
        TaskOnset_MR(3*i) = 8+(i-1)*8;
    end;
    %     end
    for m = 1:160;
        file_name = ['swau0' num2str(m,'%03u') '.nii']; %---数字を必ず3桁で表示する
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).scans{m,1} = fullfile(parent_dir,members{z},sess_name{h},'\',file_name);%
    end
    
    if z<strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'without_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_without_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'without_ERD_good', 'param', ERD_3s_without(ThirdSession_without_ERD,3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'without_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,ThirdSession_without_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'without_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,ThirdSession_without_ERD),3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_without_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_without(ThirdSession_without_ERD,3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,ThirdSession_without_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_without(setdiff(TaskOnset,ThirdSession_without_ERD),3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).orth = 1;
        
    elseif z>=strmatch('nakamura',members)
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).name = 'with_good';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).onset = ThirdSession_with_MR_ERD;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).pmod(1) = struct('name', 'with_ERD_good', 'param', ERD_3s_with(ThirdSession_with_ERD,3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(1).orth = 1;
        
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).name = 'with_bad';
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).onset = setdiff(TaskOnset_MR,ThirdSession_with_MR_ERD);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).duration = 1;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).tmod = 0;
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).pmod(1) = struct('name', 'with_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,ThirdSession_with_ERD),3), 'poly', 1);
        matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(2).orth = 1;
        
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).name = 'MI_good';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).onset = ThirdSession_with_MR_ERD;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).pmod(1) = struct('name', 'MI_ERD_good', 'param', ERD_3s_with(ThirdSession_with_ERD,3), 'poly', 1);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(3).orth = 1;
%         
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).name = 'MI_bad';
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).onset = setdiff(TaskOnset_MR,ThirdSession_with_MR_ERD);
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).duration = 1;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).tmod = 0;
%         matlabbatch{X}.spm.stats.fmri_spec.sess(h).cond(4).pmod(1) = struct('name', 'MI_ERD_bad', 'param', ERD_3s_with(setdiff(TaskOnset,ThirdSession_with_ERD),3), 'poly', 1);
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
    
    clear FirstSession_with_ERD
    clear FirstSession_with_MR_ERD
    clear SecondSession_with_ERD
    clear SecondSession_with_MR_ERD
    clear ThirdSession_with_ERD
    clear ThirdSession_with_MR_ERD
    
    clear FirstSession_without_ERD
    clear FirstSession_without_MR_ERD
    clear SecondSession_without_ERD
    clear SecondSession_without_MR_ERD
    clear ThirdSession_without_ERD
    clear ThirdSession_without_MR_ERD
    
    X = X+1;
end

for z = 1:size(members,2)
    matlabbatch{X}.spm.stats.fmri_est.spmmat = {fullfile(parent_dir,members{z},['results_representation_',num2str(trial_num),'_ERD'],'SPM.mat')};  %%
    matlabbatch{X}.spm.stats.fmri_est.method.Classical = 1;
    X=X+1;
end

save(savename);

clear all
spm fmri

