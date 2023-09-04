function [code] = cacode_generator(PRN)
%%注释 
%函数说明
%   生成C/A码
%参数说明
%   x   卫星号
%输出
%   code卫星的C/A码
%% 函数本体
g2s = [  5,   6,   7,   8,  17,  18, 139, 140, 141, 251, ...
       252, 254, 255, 256, 257, 258, 469, 470, 471, 472, ...
       473, 474, 509, 512, 513, 514, 515, 516, 859, 860, ...
       861, 862 ... end of shifts for GPS satellites 
       ... Shifts for the ground GPS transmitter are not included
       ... Shifts for EGNOS and WAAS satellites (true_PRN = PRN + 87)
                 145, 175,  52,  21, 237, 235, 886, 657, ...
       634, 762, 355, 1012, 176, 603, 130, 359, 595, 68, ...
       386];
g2shift = g2s(PRN);
g1 = zeros(1, 1023);
reg = -1*ones(1, 10);
for i=1:1023
    g1(i)       = reg(10);
    saveBit     = reg(3)*reg(10);
    reg(2:10)   = reg(1:9);
    reg(1)      = saveBit;
end
g2 = zeros(1, 1023);
reg = -1*ones(1, 10);
for i=1:1023
    g2(i)       = reg(10);
    saveBit     = reg(2)*reg(3)*reg(6)*reg(8)*reg(9)*reg(10);
    reg(2:10)   = reg(1:9);
    reg(1)      = saveBit;
end
g2 = [g2(1023-g2shift+1 : 1023), g2(1 : 1023-g2shift)];
code = -(g1 .* g2);