% A script to produce a figure for LAXS
close all;
clear;

addpath('C:\Documents and Settings\Owner\My Documents\work\MATLAB_UserFunctions\Functions\waxs_kiyo');
addpath(genpath('C:\Documents and Settings\Owner\My Documents\work\MATLAB_UserFunctions\Functions\Downloaded'));
addpath('C:\Documents and Settings\Owner\My Documents\work\chess13a\dmpclr');

addpath('~/WinC/MATLAB_UserFunctions/Functions/waxs_kiyo');
addpath('~/WinC/MATLAB_UserFunctions/Functions');
addpath(genpath('~/WinC/MATLAB_UserFunctions/Functions/Downloaded'));
addpath(genpath('~/WinE/chess12'));


a = slurp('tatdopc_071_cz.tif', 'c');
pedestal = 100;
a = a - pedestal;
a = imrotate(a, -1, 'bicubic');
figure
imagesc(a, [0 400]);
colormap(gray)
axis image
axis([322 722 100 1024])
qr = 0:0.1:1;
qz = 0:0.1:1;
wavelength = 1.1775;
beamX = 512;
beamZ = 959;
sDist = 365.1;
pixelSize = 0.07113;
add_qr_qz_labels(qr, qz, wavelength, beamX, beamZ, sDist, pixelSize);
%color_log([0 1000])
saveTightFigure(gcf, 'tatdopc071.pdf');
%saveas(gcf, 'tatdopc071.pdf')

a = slurp('tatdopcdope_057_cz.tif', 'c');
pedestal = 100;
a = a - pedestal;
a = imrotate(a, -1, 'bicubic');
figure
imagesc(a, [0 400]);
colormap(gray)
axis image
axis([322 722 100 1024])
qr = 0:0.1:1;
qz = 0:0.1:1;
wavelength = 1.1775;
beamX = 512;
beamZ = 959;
sDist = 365.1;
pixelSize = 0.07113;
add_qr_qz_labels(qr, qz, wavelength, beamX, beamZ, sDist, pixelSize);
%color_log([0 1000])
saveTightFigure(gcf, 'tatdopcdope057.pdf');
%saveas(gcf, 'tatdopcdope057.pdf')