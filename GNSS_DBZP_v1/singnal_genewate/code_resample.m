function [wave] = code_resample(code, fs_src, fs_dist)
%% 函数说明
%功能：
%   对输入的数字信号重采样
%参数：
%   code    数据
%   fs_src  源数据的采样率
%   fs_dist 目标数据的采样率
%% 
    src_len = length(code);     % 源数据的长度
    ratio = fs_dist / fs_src;
    dist_len = ceil(src_len * ratio);  % 目标数据的采样率
    
    wave = zeros(1, dist_len);  %预分配空间

    for cnt = 1:dist_len
        wave(cnt) = code(ceil(cnt/ratio));
    end

end