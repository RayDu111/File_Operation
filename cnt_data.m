%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Count how many data(one channel) in the file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;clear;
inputFolder = '/home/ry/Desktop/disk1/dataset/Mavic_Data_new_images_back_weakplus/signal/val/images'; 
inputfiles = dir(fullfile(inputFolder, '*.png'));

cnt = 0;
exist_name = '';
for i = 1:length(inputfiles)
    base_name = inputfiles(i).name(1:end-6);
    if ~strcmp(exist_name, base_name)
        exist_name = base_name;
        cnt = cnt + 1;
    end

    
end
fprintf('Total:%s\n',num2str(cnt));
fprintf('**************************************\n');
fprintf('Finish!!!!!!\n');