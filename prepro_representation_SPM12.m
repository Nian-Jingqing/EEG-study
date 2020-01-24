clear all

%% settings
savename = ['9_23_prepro'];

parent_dir = 'H:\fMRI_data'; %%
cd(parent_dir);

members={'kato','nagai','fukuoka','hara','fujimon','fujimoto','tsuduki','anzai','tomizawa','namiki','koga','miyoshi','murakami','horikoshi','nakamura','kida','hosoda','kuro','takahashi','suzuki','morishige','rin','saito','jike'};
sess_name  = {'session1','session2','session3','session4','session5','session6'};

%% make batch

Y = 1;
for z = 1:size(members,2);%---subject loop

%%% realign %%% 
    for h = 1:size(sess_name,2);
        sess = sess_name{h};
        [tmp,dirs] = spm_select('FPList',fullfile(parent_dir,members{z},'\',sess),['^' '0' '.*\' '.nii' '$']); %% img to nii
        i = 1;
        for k = 1:size(tmp,1);
            matlabbatch{Y}.spm.spatial.realignunwarp.data(h).scans{k,1} = deblank(tmp(i,:));
            matlabbatch{Y}.spm.spatial.realignunwarp.data(h).pmscan = '';
            i = i+1;
        end
    end

   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.quality = 1;  %%%%
   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.sep = 4;
   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.fwhm = 5;
   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.rtm = 0;
   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.einterp = 2;
   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.ewrap = [0 0 0];
   matlabbatch{Y}.spm.spatial.realignunwarp.eoptions.weight = '';
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.basfcn = [12 12];
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.regorder = 1;
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.lambda = 100000;
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.jm = 0;
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.fot = [4 5];
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.sot = [];
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.uwfwhm = 4;
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.rem = 1;
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.noi = 5;
   matlabbatch{Y}.spm.spatial.realignunwarp.uweoptions.expround = 'First';  %%
   matlabbatch{Y}.spm.spatial.realignunwarp.uwroptions.uwwhich = [2 1];
   matlabbatch{Y}.spm.spatial.realignunwarp.uwroptions.rinterp = 4;
   matlabbatch{Y}.spm.spatial.realignunwarp.uwroptions.wrap = [0 0 0];
   matlabbatch{Y}.spm.spatial.realignunwarp.uwroptions.mask = 1;
   matlabbatch{Y}.spm.spatial.realignunwarp.uwroptions.prefix = 'u';
         
%%% normalize estimate %%% 

    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.subj.vol{1,1}  = fullfile(parent_dir,members{z},sess_name{1},'u0001.nii');  %%
    
     l = 0;
   for h = 1:size(sess_name,2);
        sess = sess_name{h};
        for m = 1:160;        %%
            file_name = ['u0' num2str(m,'%03u') '.nii']; %%
            matlabbatch{Y+1}.spm.spatial.normalise.estwrite.subj.resample{m+l,1} = fullfile(parent_dir,members{z},sess,file_name);
             end
    l = l+160;  %%
    end
    
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.biasreg = 0.0001;
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.biasfwhm = 60;
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.tpm = {'C:\Users\killy\Desktop\spm12\tpm\TPM.nii'}; %%
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.affreg = 'mni';
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.fwhm = 0;
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.eoptions.samp = 3;
 
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.woptions.bb = [-78 -112 -70
                                                          78 76 85];
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.woptions.vox = [2 2 2];
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.woptions.interp = 4;
    matlabbatch{Y+1}.spm.spatial.normalise.estwrite.woptions.prefix = 'w';
        
%%% Smoothing %%%   
    matlabbatch{Y+2}.spm.spatial.smooth.fwhm   = [8 8 8];
    matlabbatch{Y+2}.spm.spatial.smooth.dtype  = 0;
    matlabbatch{Y+2}.spm.spatial.smooth.im     = 0;
    matlabbatch{Y+2}.spm.spatial.smooth.prefix = 's';

    l = 0;
    for h = 1:size(sess_name,2);
        sess = sess_name{h};
        for m = 1:160;       %%                       
            file_name = ['wu0' num2str(m,'%03u') '.nii'];  %% 
            matlabbatch{Y+2}.spm.spatial.smooth.data{m+l,1} = fullfile(parent_dir,members{z},sess,file_name);
        end
    l = l+160;  %%
    end
    
    Y = Y+3;
    
end %---subject loop

save(savename);
clear all
spm fmri


