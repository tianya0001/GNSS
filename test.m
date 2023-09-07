close all;
clear;
clc;

x = 1:100;
y = reshape(x, 5, 20);
s = size(y);
for m = 1:s(1)
    disp(y(:, m))
    fprintf("\n--------------------------\n");
end