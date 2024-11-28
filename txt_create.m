% 指定文件夹路径
folderPath = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/png_2048';  % 替换为你文件夹的实际路径
outputPath = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/labels'; 

% 获取文件夹中所有 .png 文件的列表
fileList = dir(fullfile(folderPath, '*.png'));

% 遍历每个 .png 文件
for i = 1:length(fileList)
    % 获取文件的基本名称（不带扩展名）
    [~, baseFileName, ~] = fileparts(fileList(i).name);
    
    % 生成对应的 .txt 文件路径
    txtFilePath = fullfile(outputPath, [baseFileName, '.txt']);
    
    % Judge if exist txt file
    if exist(txtFilePath, 'file') ~= 2
        % 创建空的 .txt 文件
        fclose(fopen(txtFilePath, 'w'));
    end
end

disp('空的 .txt 文件已生成。');
