%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% delete empty txt files.
% Please copy files before deleting.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
folderpath = '/home/ry/Desktop/disk1/1117/5790__MavicAir3/label_p6';
imgpath = '/home/ry/Desktop/disk1/1117/5790__MavicAir3//part6';

txtfiles = dir(fullfile(folderpath, '*.txt'));

for i = 1:length(txtfiles)
    txtpath = fullfile(folderpath, txtfiles(i).name);
    
    txtinfo = dir(txtpath);
    
    if (txtinfo.bytes == 0)
        delete(txtpath);
        fprintf('Deleting empty files:%s\n', txtfiles(i).name);
        img_name = [txtfiles(i).name(1:end-4)  '.png'];
        img_file = fullfile(imgpath, img_name);
        fprintf('Deleting empty files:%s\n', img_name);
        delete(img_file);
    end
end
