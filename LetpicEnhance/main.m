clc;
clear all;
close all;
 
disp('take random photo at aperture F.8.0 shutter 0.025');
I= imread('messi.jpg');
im = imresize(I,[1440 1800]);
p = find_cluster(im);
[Aper_final Shutter_final] = camera_entity(1, im)

