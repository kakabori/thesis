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
sDist = 169.8;
beamX = 32;
beamZ = 110; % same as X_cen = 1024 - 110 + 1 = 915;

a = slurp('ripple_060_cz.tif', 'c');
b = slurp('ripple_061_cz.tif', 'c');
tmp = a - b;
tmp = rotateAround(tmp, 915, 32, -0.97, 'bicubic');
waxs1 = transform_ccd2q(tmp, [0.4 2.1], [0 1.6], 0.0022, 0.0022, 0.2);
waxs1.Int = int64(waxs1.Int);
fig1 = figure;
qshow(waxs1, [0 1000]);
axis([1.2 1.7 0 1])
saveas(fig1, 'ripple_060.pdf');

k = 0;
for i = 0.04:0.02:0.30
  figure;
  qrplot_q(waxs1, [i i+0.02], 'LineStyle', 'none', 'Marker', 'o', 'Color', 'k');
  xlabel(strcat('q_r (', char(197), '^{-1})'), 'interpreter', 'tex', ...
         'FontName', 'Times New Roman', 'FontSize', 18);

  axis([1.38 1.58 0 2000]);
  avg = i + 0.01;
  str = strcat(num2str(avg), {' '}, char(197), '^{-1}');
  legend(str, 'FontName', 'Times New Roman', 'FontSize', 18);
  %saveTightFigure(gcf, strcat('qrplot', num2str(k), '.pdf'))
  k = k + 1;
end

% fluid phase data
a = slurp('fluid_036_cz.tif','c');
b = slurp('fluid_039_cz.tif','c');
tmp = a - b;
waxs2 = transform_ccd2q(tmp, [0.4 2.1], [0 1.6], 0.0022, 0.0022, 0.5);
waxs2.Int = int64(waxs2.Int);
fig2 = figure;
qshow(waxs2, [0 1000]);
axis([1.2 1.7 0 1])
saveas(fig1, 'fluid_036.pdf');
