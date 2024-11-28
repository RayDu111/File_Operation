%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copying txt with label to txt without label.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc;clear;
% txtFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/labels'; 
% 
% txtfiles = dir(fullfile(txtFolder, '*.txt'));
% 
% for i = 1:floor(length(txtfiles)/8)
%     for j = 1:8
%         index = (i-1) * 8 + j;
%         txtpath = fullfile(txtFolder, txtfiles(index).name);
%         txtinfo = dir(txtpath);
% %         fprintf('Deleting empty files:%s\n', txtfiles(index).name);
%         
%         if (txtinfo.bytes ~= 0)
%             content_path = txtpath;
%             base_name = txtfiles(index).name(1:end-5);
%             for k = 1 : 8
%                 if k ~= j
%                     txt_name = [base_name num2str(k) '.txt'];
%                     txtpath = fullfile(txtFolder, txt_name);
%                     copyfile(content_path, txtpath);
%                     fprintf('copy file:%s to %s\n', content_path, txtpath);
%                 end
%             end
%         end
% 
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copying txt to folder which has its png name.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
txtFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/labels'; 
pngFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/weak_plus/images'; 
tarFolder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/weak_plus/labels'; 

txtfiles = dir(fullfile(txtFolder, '*.txt'));
pngfiles = dir(fullfile(pngFolder, '*.png'));

for i = 1:length(pngfiles)
    txt_name = strrep(pngfiles(i).name, '.png', '.txt');
    txtpath = fullfile(txtFolder, txt_name);
    tarpath = fullfile(tarFolder, txt_name);
    copyfile(txtpath, tarpath);
    fprintf('copy file:%s to %s\n', txtpath, tarpath);
    
end
fprintf('Finish!!!!!!\n');