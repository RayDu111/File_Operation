clc;clear
input_folder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/raw_data';  % 输入文件夹路径
% middle_folder = '/home/ry/Desktop/disk1/0716/5790__MavicAir3/png';  % png dir path
output_folder = '/home/ry/Desktop/disk1/1125/5790__MavicAir3/png_2048';  % 输出文件夹路径
% png_files = dir(fullfile(middle_folder, '*.png'));
judge_folder = '/home/ry/training/1028/5790__MavicAir3(background)/png_2048';
dat_files = dir(fullfile(input_folder, '*.dat'));
png_files = dir(fullfile(input_folder, '*.png'));

% for k = 1:length(dat_files)
for k = 1:40
    dat_file_path = fullfile(input_folder, dat_files(k).name);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % judge if file is empty
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    file_info = dir(dat_file_path);
    % 判断文件是否为空
    if file_info.bytes == 0
        % 打印文件名
        fprintf('文件 %s 是空的，正在删除。\n', dat_file_path);
        
        % 删除文件
        delete(dat_file_path);
        
        % 跳过本次循环
        continue; 
    end
    
%     name = dat_files(k).name;
    
    % 打开.dat文件进行读取
    fid = fopen(dat_file_path, 'rb');
    data = fread(fid, [2048*2048*8*2, 1], 'int16');
    fclose(fid);
    
    % get the file in png
    [path, name, ext] = fileparts(dat_files(k).name);
    matching_files = dir(fullfile(judge_folder, ['*' name '*']));
    names = {matching_files.name};
    
    % 分离实部和虚部
    real_part = data(1:2:end);  % 实部
    img_part = data(2:2:end);  % 虚部

%     %% 生成fft后的picture(3 dim)
%     for n=1:8   % 8个通道
%         j = 1;
%         % judge if there is signal or not
%         name_png = [name , '_' , num2str(n) , '.png'];
%         if ismember(name_png, names)
%             for i = n:8:2048*2048*8 %%%%%%%%%%%%%%%%%%%%%
%                 comp(j) = complex(real_part(i),img_part(i));
%                 j = j+1;
%             end
%             % 初始化存储图像数据的矩阵(为了对应python中的【h、w、c】)
%             image = zeros(2048, 2048, 3);
%             for i = 1:2048
%                 fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048))) / 2048;
% 
%                 fft_power = 20*log10(abs(fft_y)./2/2048);
%                 image(i,:, 1) = fft_power;
%                 image(i,:, 2) = fft_power;
%                 image(i,:, 3) = fft_power;
%             end
%             
%             min_val = min(image(:));
%             max_val = max(image(:));
% 
%             image = (image - min_val) / (max_val - min_val);   % 归一化
%             image = single(image * 4095);                      % 按比例缩放到[0,4095], 12bit
%     %         figure()
%     %         mesh(image(:,:,1))
%     %         figure()
%     %         mesh(image(:,:,2))
%     %         figure()
%     %         mesh(image(:,:,3))
% 
%             % 构建输出文件路径及文件名
%             [~, file_name, ~] = fileparts(dat_files(k).name);
%             output_file_name = [output_folder, file_name, '_', num2str(n), '.npy'];
%             writeNPY(image, output_file_name)
% 
%     %         显示处理进度
%             disp(['Processed and saved ', output_file_name]);
%         else
%             continue;
%         end
%     end
    
    
%     %% 生成fft后的picture(3 dim)--Problem(apply judge)
%     for n=1:8   % 8个通道
%         j = 1;
%         % judge if there is signal or not
%         name_png = [name , '_' , num2str(n) , '.png'];
%         if ismember(name_png, names)
%             for i = n:8:2048*2048*8 %%%%%%%%%%%%%%%%%%%%%
%                 comp(j) = complex(real_part(i),img_part(i));
%                 j = j+1;
%             end
%             % 初始化存储图像数据的矩阵(为了对应python中的【h、w、c】)
%             image = single(zeros(2048, 2048, 3));
%             for i = 1:2048
%                 fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048))) / 2048;
% 
%                 fft_power = 20*log10(abs(fft_y)./2/2048);
%                 image(i,:, 1) = single(fft_power);
%                 image(i,:, 2) = single(fft_power);
%                 image(i,:, 3) = single(fft_power);
%             end
%     %         figure()
%     %         mesh(image(:,:,1))
%     %         figure()
%     %         mesh(image(:,:,2))
%     %         figure()
%     %         mesh(image(:,:,3))
% 
%             % 构建输出文件路径及文件名
%             [~, file_name, ~] = fileparts(dat_files(k).name);
%             output_file_name = [output_folder, file_name, '_', num2str(n), '.npy'];
%             writeNPY(image, output_file_name)
% 
%     %         显示处理进度
%             disp(['Processed and saved ', output_file_name]);
%         else
%             continue;
%         end
%     end

%     %% 生成fft后的picture(3 dim)--Problem(no judge)
%     for n=1:8   % 8个通道
%         j = 1;
%         % judge if there is signal or not
%         name_png = [name , '_' , num2str(n) , '.png'];
%         for i = n:8:2048*2048*8 %%%%%%%%%%%%%%%%%%%%%
%             comp(j) = complex(real_part(i),img_part(i));
%             j = j+1;
%         end
%         % 初始化存储图像数据的矩阵(为了对应python中的【h、w、c】)
%         image = single(zeros(2048, 2048, 3));
%         for i = 1:2048
%             fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048))) / 2048;
% 
%             fft_power = 20*log10(abs(fft_y)./2/2048);
%             image(i,:, 1) = single(fft_power);
%             image(i,:, 2) = single(fft_power);
%             image(i,:, 3) = single(fft_power);
%         end
% %         figure()
% %         mesh(image(:,:,1))
% %         figure()
% %         mesh(image(:,:,2))
% %         figure()
% %         mesh(image(:,:,3))
% 
%         % 构建输出文件路径及文件名
%         [~, file_name, ~] = fileparts(dat_files(k).name);
%         output_file_name = [output_folder, file_name, '_', num2str(n), '.npy'];
%         writeNPY(image, output_file_name)
% 
% %         显示处理进度
%         disp(['Processed and saved ', output_file_name]);
%     end
        
%     %% 生成fft后的IQ+Power三通道数据
%     for n=1:8   % 8个通道
%         for i = n:8:2048*2048*8 %%%%%%%%%%%%%%%%%%%%%
%             comp(j) = complex(real_part(i),img_part(i));
%             j = j+1;
%         end
%         % 初始化存储图像数据的矩阵(为了对应python中的【h、w、c】)
%         image = double(zeros(2048, 2048, 3));
%         for i = 1:2048
%             fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048))) / 2048;
%             fft_real = real(fft_y);
%             fft_imag = imag(fft_y);
%             image(i, :, 1) = fft_real;
%             image(i, :, 2) = fft_real;
%             
%             fft_power = 20*log10(abs(fft_y)./2/2048);
%             image(i, :, 3) = fft_power;
%         end
%         
%         % 构建输出文件路径及文件名
%         [~, file_name, ~] = fileparts(dat_files(k).name);
%         output_file_name = [output_folder, file_name, '_', num2str(n), '.npy'];
%         writeNPY(image, output_file_name)
%     
%         % 显示处理进度
%         disp(['Processed and saved ', output_file_name]);
    
%     %% 生成fft后的IQ二通道数据
%     for n=1:8   % 8个通道
%         j = 1;
%         % judge if this channel has signal or not
%         for i = n:8:2048*2048*8 %%%%%%%%%%%%%%%%%%%%%
%             comp(j) = complex(real_part(i),img_part(i));
%             j = j+1;
%         end
%         % 初始化存储图像数据的矩阵(为了对应python中的【h、w、c】)
%         image = double(zeros(2048, 2048, 2));
%         for i = 1:2048
%             fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048))) / 2048;
%             fft_real = real(fft_y);
%             fft_imag = imag(fft_y);
%             image(i,:,1) = fft_real;
%             image(i,:,2) = fft_real;
%             
% %             fft_power = 20*log10(abs(fft_y)./2/2048);
% %             image2(i,:) = fft_power;
%         end
% %         figure()
% %         mesh(image(:,:,1))
% %         figure()
% %         mesh(image(:,:,2))
% %         figure()
% %         mesh(image2)
%         
%         % 构建输出文件路径及文件名
%         [~, file_name, ~] = fileparts(dat_files(k).name);
%         output_file_name = [output_folder, file_name, '_', num2str(n), '.npy'];
%         writeNPY(image, output_file_name)
%     
%         % 显示处理进度
%         disp(['Processed and saved ', output_file_name]);
%     end
%         
    %% 生成图片(eight)
    for n=1:8   % 8个通道
        j=1;
        for i = n:8:2048*2048*8 %%%%%%%%%%%%%%%%%%%%%
            comp(j) = complex(real_part(i),img_part(i));
            j = j+1;
        end
        % 初始化存储图像数据的矩阵
        image = double(zeros(2048, 2048));
        for i = 1:2048
            fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048)));
            fft_power = 20*log10(abs(fft_y)./2/2048);
            image(i,:) = fft_power;
        end
%         figure();
%         mesh(image)
        min_val = min(image(:));
        max_val = max(image(:));
            
        image = (image - min_val) / (max_val - min_val);   % 归一化
        image = uint8(image * 255);                        % 按比例缩放到[0,255]
%         image = imresize(image, [640, 640]);
        % 构建输出文件路径及文件名
        [~, file_name, ~] = fileparts(dat_files(k).name);
        output_file_path = fullfile(output_folder, [file_name, '_', num2str(n), '.png']);%%%%%%%%%%%%
    
        % 保存处理后的图像为.png文件
        imwrite(image, output_file_path);
    
        % 显示处理进度
        disp(['Processed and saved ', output_file_path]);
    end
%     %% 生成图片(one channel)
%     for i = 1:1:2048*2048 %%%%%%%%%%%%%%%%%%%%%
%         comp(i) = complex(real_part(i),img_part(i));
%     end
%     % 初始化存储图像数据的矩阵
%     image = double(zeros(2048, 2048));
%     for i = 1:2048
%         fft_y = fftshift(fft(comp(i*2048+1-2048:i*2048)));
%         fft_power = 20*log10(abs(fft_y)./2/2048);
%         image(i,:) = fft_power;
%     end
% %     figure();
% %     mesh(image)
%     min_val = min(image(:));
%     max_val = max(image(:));
% 
%     image = (image - min_val) / (max_val - min_val);   % 归一化
%     image = uint8(image * 255);                        % 按比例缩放到[0,255]
% %         image = imresize(image, [640, 640]);
%     % 构建输出文件路径及文件名
%     [~, file_name, ~] = fileparts(dat_files(k).name);
%     output_file_path = fullfile(output_folder, [file_name, '.png']);%%%%%%%%%%%%
% 
%     % 保存处理后的图像为.png文件
%     imwrite(image, output_file_path);
% 
%     % 显示处理进度
%     disp(['Processed and saved ', output_file_path]);
end
disp('**********************')
disp('Processed Done!!!!!')