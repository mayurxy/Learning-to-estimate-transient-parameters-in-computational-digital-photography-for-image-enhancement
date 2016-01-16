clc;
clear all;
close all;
format long;

original1= imread('E:\MT DNL\major project\Database V_2\Intensity=230\F=6.3\S0.0125_f6.3.jpg');
original = imresize(original1,[1440 1800]);
[y x] = size(original);

im = rgb2gray(original);
contra=contrast(im);

Entropy=entropy(im)

img=rgbnormalise(original);        
imshow(img);
if (contra <= 0.30)
 {         
blurr(original)
}

else 
    {
blurr(img);
}

end