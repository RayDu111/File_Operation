clear;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 判断图传信号是强是弱
% Question1: if noise is in the box, then result is not correct.
% Question2: exist fuzzy region. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% root path
root_path = '/home/ry/Desktop/disk1/1117/5790__MavicAir3';
% input pathlianxiangzhengjiu
img_folder = [root_path, '/weak/png_2048'];    % 图片文件夹路径
label_folder = [root_path, '/weak/labels'];  % 标签文件夹路径

% judge if path exist
if ~exist(img_folder, 'dir')
    error('No file:%s\n', img_folder);
end
if ~exist(label_folder, 'dir')
    error('No file:%s\n', label_folder);
end


% output path
strong_output = [root_path, '/weak_plus/png_2048'];     % 图片输出文件夹
label_output = [root_path, '/weak_plus/labels'];

% judge if path exist
if ~exist(strong_output, 'dir')
    error('create file:%s\n', strong_output);
end
if ~exist(label_output, 'dir')
    error('create file:%s\n', label_output);
end


png_files = dir(fullfile(img_folder, '*.png'));
txt_files = dir(fullfile(label_folder, '*.txt'));

threshold1 = 1.0655;  % 判断阈值, upper bound!!
threshold2 = 1.0155;  % 判断阈值, upper bound!!

% input path
raw_folder = [root_path, '/weak/raw_data'];
if ~exist(raw_folder, 'dir')
    error('No file:%s\n', raw_folder);
end
% output path
raw_output = [root_path, '/weak_plus/raw_data'];
if ~exist(raw_output, 'dir')
    error('create file:%s\n', raw_output);
end
raw_files = dir(fullfile(raw_folder, '*.dat'));

for k = 1 : length(png_files)
    png_file_path = fullfile(img_folder, png_files(k).name);
    txt_file_path = fullfile(label_folder, txt_files(k).name);
    raw_file_path = fullfile(raw_folder, raw_files(k).name);
    img = imread(png_file_path);
    img2 = img;
%     figure;
%     mesh(img);
%     hold on;
    [h, w] = size(img2);
    txt = load(txt_file_path);
    obj_cnt = size(txt,1);
    sig = 0;     % 图传信号
    sig_cnt = 0; % 信号点数
    sig_ave = 0; % 图传信号平均值
    for i = 1 : obj_cnt
        c_x = txt(i, 2) * w;
        c_y = txt(i, 3) * h;
        b_w = txt(i, 4) * w;
        b_h = txt(i, 5) * h;
        x_min = round(c_x - b_w / 2);
        y_min = round(c_y - b_h / 2);
        if (x_min == 0)
            x_min = 1;
        end
        if (y_min == 0)
            y_min = 1;
        end
        % 在图上标注点
%         plot3(x_min, y_min, 200, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
%         hold on;
        x_max = round(c_x + b_w / 2);
        y_max = round(c_y + b_h / 2);
        % 在图上标注点
%         plot3(x_max, y_max, 200, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
%         hold on;
        sig = sig + sum(sum(img2(y_min: y_max, x_min: x_max))); % 信号点累加
        sig_cnt = sig_cnt + (x_max - x_min + 1) * (y_max - y_min + 1); % 计算信号点总数
        img2(y_min: y_max, x_min: x_max) = 0;
    end
%     figure;
%     mesh(img);
    sig_ave = sig / sig_cnt;
    back_ave = Noise_Cal(img2);
    snr = sig_ave / back_ave;
%     fprintf('%s的信噪比是：%s，其中sig=%s、sig_cnt=%s\n', png_files(k).name,  num2str(snr), num2str(sig), num2str(sig_cnt));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 如果是weak信号，把图片移动到一个文件夹
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if(snr < threshold2)
         % 移动文件
        movefile(png_file_path, strong_output);
        movefile(txt_file_path, label_output);
        movefile(raw_file_path, raw_output);
%         fprintf('%s的信噪比是：%s\n', png_files(k).name,  num2str(snr));
        fprintf('Moved %s to %s\n', png_files(k).name, strong_output); % 打印移动信息
    end
end
fprintf('**********************************\n');
fprintf('完成！\n');
