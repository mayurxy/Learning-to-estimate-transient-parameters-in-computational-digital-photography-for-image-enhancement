function [aper_new shutter_new] = camera_entity(no, image)

im = rgb2gray(image);
contra=contrast(im)

Entropy=entropy(im)

img=rgbnormalise(image);
imshow(img);

if (contra < 0.30)
    blur_content=blurr(image)
else
    blur_content=blurr(img)
end

switch(no)
    
    case 1 
        [aper_new shutter_new] = suggestion_cluster1(blur_content,image,contra);
        
        
    case 2 
        [aper_new shutter_new] = suggestion_cluster2(blur_content,image,contra);
        
    case 3
        [aper_new shutter_new] = suggestion_cluster3(blur_content,image,contra);
     
    otherwise 
        disp('out of the memory of camera');
        
end
