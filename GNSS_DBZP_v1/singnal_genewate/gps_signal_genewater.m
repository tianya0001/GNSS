function [wave] = gps_signal_genewater(fs, f, n, prn)
%GPS_SIGNAL_GENEWATER 生成GPS调制信号
% fs    采样频率  
% n     总时间(ms)
% prn   卫星编号

    cacode_fs = 1.023e6;

    T = n * 1.0e-3;

    t = 1/fs:1/fs:T;

    % 生成CA码
    cacode = cacode_generator(prn);
    cacode = repmat(cacode, 1, n);
    cacode_wave = code_resample(cacode, cacode_fs, fs);

    wave = cacode_wave .* sin(2*pi*f*t);
    % 
end

