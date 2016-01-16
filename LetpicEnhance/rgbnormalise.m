function im = rgbnormalise(img)

% r=image(:,:,1);
% v=image(:,:,2);
% b=image(:,:,3);
% 
% r1 = histeq(r);
% v1 = histeq(v);
% b1 = histeq(b);
% 
% im = cat(3,r1,v1,b1);


img_adjusted = zeros(size(img),'uint8');
 for ch=1:3
       img_adjusted(:,:,ch) = adapthisteq(img(:,:,ch));
 end
%imshow(img_adjusted1);


hsvimg = rgb2hsv(img_adjusted);
for ch=2:3
      hsvimg(:,:,ch) = imadjust(hsvimg(:,:,ch), ...
      stretchlim(hsvimg(:,:,ch), 0.1));
end
img_adjusted1 = hsv2rgb(hsvimg);
im= img_adjusted1;
imshow(img_adjusted1);
