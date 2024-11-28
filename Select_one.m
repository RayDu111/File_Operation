%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Select data which not repeats.(from different strength)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% weak have, weak_plus don't have.
% clc;clear;
% basepath = '/home/ry/Desktop/disk1/*8*6/5790_mAViCAiR3_Ruo(OK)';
% strongpath = [basepath '/strong'];
% weakpath = [basepath '/weak'];
% weak2path = [basepath '/weak_plus'];
% 
% w_pngFolder = [weakpath '/images'];
% w_txtFolder = [weakpath '/labels'];
% w_imgfiles = dir(fullfile(w_pngFolder, '*.png'));
% w_txtfiles = dir(fullfile(w_txtFolder, '*.txt'));
% 
% w2_pngFolder = [weak2path '/images'];
% w2_txtFolder = [weak2path '/labels'];
% w2_imgfiles = dir(fullfile(w2_pngFolder, '*.png'));
% w2_txtfiles = dir(fullfile(w2_txtFolder, '*.txt'));
% 
% targetpath = '/home/ry/Desktop/disk1/dataset/Mavic_Data_new_images_back_weakplus/signal/weak';
% t_pngFolder = [targetpath '/images'];
% t_txtFolder = [targetpath '/labels'];
% 
% exist_name = '';
% for i = 1:length(w_imgfiles)
%     base_name = w_imgfiles(i).name(1:end-6);
%     
%     for j = 1 : length(w2_imgfiles)
%         if strcmp(w2_imgfiles(j).name(1:end-6), base_name)
%             break;
%         elseif j == length(w2_imgfiles)
%             txt_path = fullfile(w_txtFolder ,w_txtfiles(i).name);
%             png_path = fullfile(w_pngFolder ,w_imgfiles(i).name);
%             fprintf('No file:%s\n', txt_path);
%             fprintf('No file:%s\n', png_path);
%             copyfile(txt_path, t_txtFolder);
%             copyfile(png_path, t_pngFolder);
%         end
%     end
% end
% 
% fprintf('**************************************\n');
% fprintf('Finish!!!!!!\n');

%% weak and weak_plus have, strong don't have.
clc;clear;
basepath = '/home/ry/Desktop/disk1/*8*6/2440__MavicAir3(OK)';
strongpath = [basepath '/strong'];
weakpath = [basepath '/weak'];
weak2path = [basepath '/weak_plus'];

w_pngFolder = [weakpath '/images'];
w_txtFolder = [weakpath '/labels'];
w_imgfiles = dir(fullfile(w_pngFolder, '*.png'));
w_txtfiles = dir(fullfile(w_txtFolder, '*.txt'));

w2_pngFolder = [weak2path '/images'];
w2_txtFolder = [weak2path '/labels'];
w2_imgfiles = dir(fullfile(w2_pngFolder, '*.png'));
w2_txtfiles = dir(fullfile(w2_txtFolder, '*.txt'));

s_pngFolder = [strongpath '/images'];
s_txtFolder = [strongpath '/labels'];
s_imgfiles = dir(fullfile(s_pngFolder, '*.png'));
s_txtfiles = dir(fullfile(s_txtFolder, '*.txt'));

targetpath = '/home/ry/Desktop/disk1/dataset/Mavic_Data_new_images_back_weakplus/signal/strong';
t_pngFolder = [targetpath '/images'];
t_txtFolder = [targetpath '/labels'];

exist_name = '';
for i = 1:length(s_imgfiles)
    base_name = s_imgfiles(i).name(1:end-6);
    
    for j = 1 : length(w2_imgfiles)
        if strcmp(w2_imgfiles(j).name(1:end-6), base_name)
            break;
        elseif j == length(w2_imgfiles)
            for k = 1 : length(w_imgfiles)
                if strcmp(w_imgfiles(k).name(1:end-6), base_name)
                    break;
                elseif k == length(w_imgfiles)
                    txt_path = fullfile(s_txtFolder ,s_txtfiles(i).name);
                    png_path = fullfile(s_pngFolder ,s_imgfiles(i).name);
                    fprintf('No file:%s\n', txt_path);
                    fprintf('No file:%s\n', png_path);
                    copyfile(txt_path, t_txtFolder);
                    copyfile(png_path, t_pngFolder);       
                end    
            end
        end
    end
end

fprintf('**************************************\n');
fprintf('Finish!!!!!!\n');