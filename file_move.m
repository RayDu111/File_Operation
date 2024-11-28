clc;clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% move one file to another file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义源文件夹和目标文件夹路径
sourceFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/raw_data'; % 替换为源文件夹路径
destinationFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/640'; % 替换为目标文件夹路径

% 确保目标文件夹存在,如果不存在则创建
if ~exist(destinationFolder, 'dir')
    mkdir(destinationFolder);
end

% 获取源文件夹中所有的.dat文件
filePattern = fullfile(sourceFolder, '*.png');
datFiles = dir(filePattern);

% 遍历所有.dat文件并移动它们
for k = 1:length(datFiles)
    baseFileName = datFiles(k).name;
    fullFileName = fullfile(sourceFolder, baseFileName);
    
    % 构建目标文件路径
    destinationFile = fullfile(destinationFolder, baseFileName);
    
    % 移动文件
    movefile(fullFileName, destinationFile);
    
    fprintf(1, 'Moved file %s to %s\n', fullFileName, destinationFile);
end

fprintf(1, 'All .dat files have been moved successfully.\n');