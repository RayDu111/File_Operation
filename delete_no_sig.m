%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In eight channel data, deleting data without signal.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear;
pngFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/png_2048'; 
txtFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/labels'; 
rawFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/raw_data';

txtfiles = dir(fullfile(txtFolder, '*.txt'));
pngfiles = dir(fullfile(pngFolder, '*.png'));
rawfiles = dir(fullfile(rawFolder, '*.dat'));

for i = 1:length(rawfiles)
    % 获取文件的基本名称（不带扩展名）
    [~, baseFileName, ~] = fileparts(rawfiles(i).name);
    for j = 1:8
        index = (i-1) * 8 + j;
        txtpath = fullfile(txtFolder, txtfiles(index).name);
        txtinfo = dir(txtpath);
%         fprintf('Deleting empty files:%s\n', txtfiles(index).name);
        
        if (txtinfo.bytes ~= 0)
            break;
        % no signal
        elseif(j == 8)
            for k = index:-1:index-7
                txtpath = fullfile(txtFolder, txtfiles(k).name);
                pngpath = fullfile(pngFolder, pngfiles(k).name);
                delete(txtpath);
                delete(pngpath);
%                 fprintf('Deleting empty files:%s\n', txtpath);
%                 fprintf('Deleting empty files:%s\n', pngpath);
            end
            datpath = fullfile(rawFolder, [baseFileName '.dat']);
            delete(datpath);
            fprintf('Deleting empty files:%s\n', datpath);
        end
    end
    
end