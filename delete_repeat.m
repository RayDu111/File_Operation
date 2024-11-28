%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Delete repeat channel file.(txt/png)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear;
pngFolder = '/home/ry/Desktop/disk1/1012/5790__MavicAir3_ruo/strong/images';
txtFolder = '/home/ry/Desktop/disk1/1012/5790__MavicAir3_ruo/strong/labels'; 
imgfiles = dir(fullfile(pngFolder, '*.png'));
txtfiles = dir(fullfile(txtFolder, '*.txt'));

exist_name = '';
for i = 1:length(imgfiles)
    base_name = imgfiles(i).name(1:end-6);
    if ~strcmp(exist_name, base_name)
        exist_name = base_name;
    else
        txtpath = fullfile(txtFolder, txtfiles(i).name);
        delete(txtpath);
        fprintf('Deleting file:%s\n', txtpath);
        
        pngpath = fullfile(pngFolder, imgfiles(i).name);
        delete(pngpath);
        fprintf('Deleting file:%s\n', pngpath);
    end
    
end

fprintf('**************************************\n');
fprintf('Finish!!!!!!\n');