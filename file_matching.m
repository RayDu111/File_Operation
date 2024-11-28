clc;clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pngFolder is more. We want to delete some in it.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义包含.png文件的源文件夹和需要查找的目标文件夹
pngFolder = '/home/ry/Desktop/training/1012/5790__MavicAir3_ruo(OK)/raw_data'; % 替换为包含.png文件的文件夹路径
searchFolder = '/home/ry/Desktop/training/1012/5790__MavicAir3_ruo(OK)/png_2048(OK)'; % 替换为需要查找的文件夹路径

% 获取源文件夹中所有的.png文件
pngFiles = dir(fullfile(pngFolder, '*.dat'));

%% raw = 8
% 遍历所有.png文件
for i = 1:length(pngFiles)
    % 获取当前.png文件的完整名称和路径
    pngFileName = pngFiles(i).name;
    pngFilePath = fullfile(pngFolder, pngFileName);
    % 提取文件名（不包括.png后缀）
    [~, baseFileName, ~] = fileparts(pngFileName);
    for j = 1 : 8
        pngFileName = [baseFileName '_' num2str(j)];
        
        % 在searchFolder中查找包含baseFileName的文件
        searchPattern = fullfile(searchFolder, ['*', pngFileName, '*']);
        matchingFiles = dir(searchPattern);

        % 如果没有找到匹配的文件，删除.png文件
        if ~isempty(matchingFiles)
            break;
        end
        if j == 8
            delete(pngFilePath);
            fprintf('Deleted: %s (No matching file found)\n', pngFilePath);
        end
    end
    

end
%% name no difference
% % 遍历所有.png文件
% for i = 1:length(pngFiles)
%     % 获取当前.png文件的完整名称和路径
%     pngFileName = pngFiles(i).name;
%     pngFilePath = fullfile(pngFolder, pngFileName);
%     
%     % 提取文件名（不包括.png后缀）
%     [~, baseFileName, ~] = fileparts(pngFileName);
%     
%     % 在searchFolder中查找包含baseFileName的文件
%     searchPattern = fullfile(searchFolder, ['*', baseFileName, '*']);
%     matchingFiles = dir(searchPattern);
%     
%     % 如果没有找到匹配的文件，删除.png文件
%     if isempty(matchingFiles)
% %         delete(pngFilePath);
%         fprintf('Deleted: %s (No matching file found)\n', pngFilePath);
% %     else
% %         fprintf('Kept: %s (Matching file found)\n', pngFilePath);
%     end
% end

fprintf('Processing complete.\n');