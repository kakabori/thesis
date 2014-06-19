% A script to produce figures for WAXS
close all;
clear;
global wavelength pixelSize sDist beamX beamZ
addpath(genpath('C:\Documents and Settings\Owner\My Documents\work\MATLAB_UserFunctions\Functions\Downloaded'));
addpath('C:\Documents and Settings\Owner\My Documents\work\MATLAB_UserFunctions\Functions\waxs_kiyo');
addpath(genpath('C:\Documents and Settings\Owner\My Documents\work\chess13a'));

wavelength = 1.175;
pixelSize = 0.07113;
sDist = 220.6;
beamX = -245;
beamZ = 96; % same as X_cen = 1024 - 96 + 1 = 929;

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

a = slurp('dmpc1_052_cz.tif', 'c');
b = slurp('dmpc1_053_cz.tif', 'c');
tmp = a - b;
a = slurp('dmpc1_060_cz.tif', 'c');
b = slurp('dmpc1_061_cz.tif', 'c');
tmp2 = a - b;
tmp = (tmp + tmp2) / 2;
tmp = rotateAround(tmp, 929, -245, -0.57, 'bicubic');
waxs2 = transform_ccd2q(tmp, [0.4 2.1], [0 1.6], 0.0017, 0.0017, 0.2);
waxs2.Int = int64(waxs2.Int);
fig2 = figure;
qshow(waxs2, [0 50]);
%saveas(fig2, 'dmpc1_052-060.pdf');
fig3 = figure;
qshow(waxs2, [0 100]);
axis([1.3 1.6 0 0.8])
saveas(fig3, 'dmpc1_enlarge.pdf');

k = 0;
for i = 0.04:0.02:0.30
  figure;
  qrplot_q(waxs2, [i i+0.02], 'LineStyle', 'none', 'Marker', 'o', 'Color', 'k');
  xlabel(strcat('q_r (', char(197), '^{-1})'), 'interpreter', 'tex', ...
         'FontName', 'Times New Roman', 'FontSize', 18);

  axis([1.38 1.58 0 110]);
  avg = i + 0.01;
  str = strcat(num2str(avg), {' '}, char(197), '^{-1}');
  legend(str, 'FontName', 'Times New Roman', 'FontSize', 18);
  saveTightFigure(gcf, strcat('qrplot', num2str(k), '.pdf'))
  k = k + 1;
end