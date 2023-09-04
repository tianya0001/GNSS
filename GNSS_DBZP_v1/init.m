
path = '../data/data_in/';   % 文件路径
file_name = 'ANALOG_DATA';
fs = 26e6;      
len = 10000;  % 1000ms
prn = [1, 2];
As = [1, 2];
wave_shift = [1000 2000];
f_err = [2500 5000];
f = 6.5e6;
sig_snr = -50:-10;

% 生成GPS信号

for snr = sig_snr
    
    gps_sig = zeros(1, fs*len*1.0e-3);
    
    for cnt = 1:length(prn)
        print_string(">");
        wave = gps_signal_genewater(fs, f+f_err(cnt), len, prn(cnt)) * As(cnt);
        wave = circshift(wave, wave_shift(cnt));
        gps_sig = gps_sig+wave;
    end

    gps_sig = awgn(gps_sig, snr);
    gps_sig = int8(gps_sig);

    % 写入文件
    fid = fopen([path, file_name, '_', num2str(snr), 'dB.bin'], 'wb');
    fwrite(fid, gps_sig, 'int8');
    fclose(fid);
end





