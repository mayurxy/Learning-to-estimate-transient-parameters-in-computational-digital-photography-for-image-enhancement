function [y] = find_cluster(image)

%[z x] = size(image);
flag = 1;
im = rgb2gray(image);
contra=contrast(im)

Entropy=entropy(im)

img=rgbnormalise(image);
imshow(img);
% blur_content1= blurr(image)
% blur_content2= blurr(img)

if (contra < 0.30)
    blur_content=blurr(image)
else
    blur_content=blurr(img)
end



% blur_content= blurr(image)

if ((Entropy > 4)&&(Entropy<6))
    disp('black streaks');
    
else if ((Entropy > 5.5)&&(Entropy<10))
        
        disp('Acceptable image');
        flag = 1;
        
    else if ((Entropy > 0)&&(Entropy<4))
            disp('White photos');
        end
    end
end



if (flag == 1)
    if  ((contra > 0) && (contra < 0.03))
        y=1;
    else if ((contra > 0.03) && (contra < 0.1))
            y=2;
        else if ((contra > 0.1) && (contra < 1))
                y=3;
            else
                disp('check image');
            end
        end
    end
    
else
    disp('serious issue');
end
