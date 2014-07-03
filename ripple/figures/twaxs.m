% A script to produce figures for WAXS
close all;
clear;
global wavelength pixelSize sDist beamX beamZ
addpath(genpath('C:\Documents and Settings\Owner\My Documents\work\MATLAB_UserFunctions\Functions\Downloaded'));
addpath('C:\Documents and Settings\Owner\My Documents\work\MATLAB_UserFunctions\Functions\waxs_kiyo');
addpath(genpath('C:\Documents and Settings\Owner\My Documents\work\chess11'));

addpath(genpath('~/WinC/MATLAB_UserFunctions/Functions/Downloaded'));
addpath('~/WinC/MATLAB_UserFunctions/Functions/waxs_kiyo');
addpath('~/WinC/MATLAB_UserFunctions/Functions');
addpath(genpath('~/WinE/chess11'));

wavelength = 1.176;
pixelSize = 0.07113;
%sDist = 158.6;
sDist = 160.6;
beamX = 29;
beamZ = 510; % same as X_cen = 1024 - 510 + 1 = 929;

% a = slurp('dmpc1_046_cz.tif', 'c');
% b = slurp('dmpc1_047_cz.tif', 'c');
% tmp = a - b;
% tmp = rotateAround(tmp, 929, -245, -0.57, 'bicubic');
% tmp = 0.7 * tmp;
% waxs1 = transform_ccd2q(tmp, [0.4 2.1], [0 1.6], 0.0017, 0.0017, 0.2);
% waxs1.Int = int64(waxs1.Int);
% fig1 = figure;
% qshow(waxs1, [0 50]);
% saveas(fig1, 'dmpc1_046.pdf');

a = slurp('waxs_003_cz.tif', 'c');
b = slurp('bkgd_002_cz.tif', 'c');
a = a - 110;
b = b - 100;
b = b * 6.9;
tmp = a - b;
%tmp = rotateAround(tmp, 929, -245, -0.57, 'bicubic');
waxs1 = transform_ccd2q(tmp, [0.6 1.8], [-0.6 1], 0.0024, 0.0024, -45);
waxs1.Int = int64(waxs1.Int);
fig1 = figure;
qshow(waxs1, [0 2000]);
axis([1.3 1.7 -0.6 0.6])
%saveas(fig1, 'waxs_003.pdf');

k = 0;
for i = -0.05:0.02:0.21
  figure;
  qrplot_q(waxs1, [i i+0.02], 'LineStyle', 'none', 'Marker', 'o', 'Color', 'k');
  xlabel(strcat('q_r (', char(197), '^{-1})'), 'interpreter', 'tex', ...
         'FontName', 'Times New Roman', 'FontSize', 18);

  axis([1.38 1.58 0 2000]);
  avg = i + 0.01;
  str = strcat(num2str(avg), {' '}, char(197), '^{-1}');
  legend(str, 'FontName', 'Times New Roman', 'FontSize', 18);
  %saveTightFigure(gcf, strcat('twaxs_qrplot', num2str(k), '.pdf'))
  k = k + 1;
end
% do qz=0 again
figure;
qrplot_q(waxs1, [-0.01 0.01], 'LineStyle', 'none', 'Marker', 'o', 'Color', 'k');
xlabel(strcat('q_r (', char(197), '^{-1})'), 'interpreter', 'tex', ...
       'FontName', 'Times New Roman', 'FontSize', 18);
axis([1.38 1.58 0 2000]);
str = strcat('0', {' '}, char(197), '^{-1}');
legend(str, 'FontName', 'Times New Roman', 'FontSize', 18);
saveTightFigure(gcf, strcat('twaxs_qrplot2.pdf'))
  
figure;
qzplot_q(waxs1, [1.46 1.52], 'LineStyle', 'none', 'Marker', 'o', 'Color', 'k');
xlabel(strcat('q_z (', char(197), '^{-1})'), 'interpreter', 'tex', ...
       'FontName', 'Times New Roman', 'FontSize', 18);
axis([-0.3 0.3 600 1600]);
saveTightFigure(gcf, strcat('twaxs_qzplot.pdf'))

%figure;
%qzplot_q(waxs1, [1.462 1.486], 'LineStyle', 'none', 'Marker', 'o', 'Color', 'k');
%xlabel(strcat('q_z (', char(197), '^{-1})'), 'interpreter', 'tex', ...
%       'FontName', 'Times New Roman', 'FontSize', 18);
%axis([-0.3 0.3 0 2000]);
%saveTightFigure(gcf, strcat('twaxs_qzplot2.pdf'))
