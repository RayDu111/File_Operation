clc;clear
% %% raw_Data -> labels
% % 定义源文件夹、目标文件夹和输出文件夹的路径
% source_folder = '/home/ry/Desktop/disk1/0716/5790__MavicAir3/raw_data';
% target_folder = '/home/ry/yolov5-master/data/labels/train';
% output_folder = '/home/ry/Desktop/disk1/0716/5790__MavicAir3/labels';
% 
% % 确保输出文件夹存在
% if ~exist(output_folder, 'dir')
%     mkdir(output_folder);
% end
% 
% % 获取源文件夹中的所有 .mat 文件
% mat_files = dir(fullfile(source_folder, '*.dat'));
% 
% % 遍历每个 .mat 文件
% for i = 1:length(mat_files)
%     % 获取文件名（不包括扩展名）
%     [~, filename, ~] = fileparts(mat_files(i).name);
%     
%     % 在目标文件夹中查找包含此文件名的文件
%     matching_files = dir(fullfile(target_folder, ['*' filename '*']));
%     
% %     if isempty(matching_files)
% %         fprintf('No matching file found for: %s\n', filename);
% %     end
%     
%     % 复制匹配的文件到输出文件夹
%     for j = 1:length(matching_files)
%         source_file = fullfile(target_folder, matching_files(j).name);
%         dest_file = fullfile(output_folder, matching_files(j).name);
%         copyfile(source_file, dest_file);
%         disp(['Copied: ' matching_files(j).name]);
%     end
% end
% 
% disp('Process completed.');

% %% raw_Data != 9
% % 定义源文件夹、目标文件夹和输出文件夹的路径
% source_folder = '/home/ry/Desktop/disk1/*8*6/5790_mAViCAiR3_Ruo/raw_data';
% 
% 
% 
% % 获取源文件夹中的所有 .mat 文件
% mat_files = dir(fullfile(source_folder, '*.dat'));
% 
% % 遍历每个 .mat 文件
% for i = 1:length(mat_files)
%     % 获取文件名（不包括扩展名）
%     [~, filename, ~] = fileparts(mat_files(i).name);
%     
%     % 在目标文件夹中查找包含此文件名的文件
%     matching_files = dir(fullfile(source_folder, ['*' filename '*']));
%     if (numel(matching_files) ~= 9)
%         fprintf('file is not 9: %s\n', filename);
%     end
% end
% 
% disp('Process completed.');

%% delete raw_Data != labels
% 定义源文件夹、目标文件夹和输出文件夹的路径
% target_folder = '/home/ry/training/1012/5790__MavicAir3(OK)/png_2048';
source_folder = '/home/ry/training/1012/5790__MavicAir3(OK)/png_2048';
target_folder = '/home/ry/training/1012/5790__MavicAir3(OK)/labels';

% 获取源文件夹中的所有 .mat 文件
mat_files = dir(fullfile(source_folder, '*.png'));

% 遍历每个 .mat 文件
for i = 1:length(mat_files)
    % 获取文件名（不包括扩展名）
    [~, filename, ~] = fileparts(mat_files(i).name);
    
    % 在目标文件夹中查找包含此文件名的文件
    matching_files = dir(fullfile(target_folder, ['*' filename '*']));
    
    if isempty(matching_files)
        fprintf('No matching file found for: %s\n', filename);
        FilePath = [source_folder '/' filename '.png'];
%         delete(FilePath);
        fprintf('Deleted: %s (No matching file found)\n', FilePath);
    else
%         fprintf('No matching file found for: %s\n', filename);
%         FilePath = [source_folder '/' filename '.npy'];
%         delete(FilePath);
%         fprintf('Deleted: %s (No matching file found)\n', FilePath);
    end
    
end
% %% move train data to val data
% % 定义源文件夹、目标文件夹和输出文件夹的路径
% target_folder = '/home/ry/Desktop/disk1/train_strong_weak/labels';
% source_folder = '/home/ry/Desktop/disk1/train_strong_weak/images';
% outpath = '/home/ry/Desktop/disk1/val_strong_weak/images';
% 
% % 获取源文件夹中的所有 .mat 文件
% mat_files = dir(fullfile(source_folder, '*.npy'));
% 
% % 遍历每个 .mat 文件
% for i = 1:length(mat_files)
%     % 获取文件名（不包括扩展名）
%     [~, filename, ~] = fileparts(mat_files(i).name);
%     
%     % 在目标文件夹中查找包含此文件名的文件
%     matching_files = dir(fullfile(target_folder, ['*' filename '*']));
%     
%     if isempty(matching_files)
%         FilePath = [source_folder '/' filename '.npy'];
%         desPath = [outpath '/' filename '.npy'];
%         status = movefile(FilePath, desPath);
%         if status
%             disp('move success');
%         else
%             disp('move fail');
%         end
%     else
% %         fprintf('No matching file found for: %s\n', filename);
% %         FilePath = [source_folder '/' filename '.npy'];
% %         delete(FilePath);
% %         fprintf('Deleted: %s (No matching file found)\n', FilePath);
%     end
%     
% end

disp('Process completed.');