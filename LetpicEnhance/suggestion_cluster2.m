function [newAper NewShutter] = suggestion_cluster2(blur_content,image,contra)

StanValAper=[5 6.3 8 10 13 16 20]
NewAper = 3;




%intensity 190   5 6.3 8 10 13 16 20
p1=[6.47e-006 4.598e-005 4.84e-005 -1.418e-005 0.0001521 0.0008641 0.001464];
p2=[-0.0003627 -0.002089 -0.002182 0.001044 -0.0064 -0.03822 -0.06393];
p3=[0.007395 0.03222 0.03354 -0.02029 0.09129 0.5651 0.9321];
p4=[-0.05066 -0.1668 -0.1735 0.1196 -0.4392 -2.788 -4.532];

% n=1
% if n==1
%     i=3;
%     y = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
% end
%NewShutter = XXX(blur_content,p1,p2,p3,p4)

ChkFunctBlur=10;
blurvalue = (100*blur_content);
x = blurvalue-ChkFunctBlur;


i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Shutter_final = quantize_shutter(NewShutter);
NewShutter = Shutter_final ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%export this shutter speed
save('s1.text', 'NewShutter','-ASCII');
save('flag.text', 1, '-ASCII');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('flag.text', 0, '-ASCII');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I= imread('E:\MT DNL\major project\Database V_2\Intensity=190\F=8\S0.0031_f8.jpg');
im = imresize(I,[1440 1800]);
%n = find_cluster(im)
%blur_content = 0.483774528638935;
%im = rgb2gray(image);
contra=contrast(im)

Entropy=entropy(im)

img=rgbnormalise(im);        
% imshow(img);
% blur_content1= blurr(image)
% blur_content2= blurr(img)

if (contra < 0.30)
    blur_content=blurr(im)
else
    blur_content=blurr(img)
end

blurvalue = (100*blur_content);
x = blurvalue-ChkFunctBlur;


j=3;
while(NewAper<=5)
if contra >= 0.75
    disp('Need to change aperture, the image with high shutter speed is dark.')
    NewAper = StanValAper(j-1)
else
    
i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
break;
end


j=j-1;

end
   
   




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Shutter_final = quantize_shutter(NewShutter);
NewShutter = Shutter_final ;
I= imread('E:\MT DNL\major project\Database V_2\Intensity=190\F=8\S0.0666_f8.jpg');
im = imresize(I,[1440 1800]);
%n = find_cluster(im)
%blur_content = 0.483774528638935;
%im = rgb2gray(image);
contra=contrast(im)

Entropy=entropy(im)

img=rgbnormalise(im);        
% imshow(img);
% blur_content1= blurr(image)
% blur_content2= blurr(img)

if (contra < 0.30)
    blur_content=blurr(im)
else
    blur_content=blurr(img)
end

blurvalue = (100*blur_content);
ChkFunctBlur=1;
x = blurvalue-ChkFunctBlur;



j=3;
while(NewAper<=5)
if contra >= 0.75
    disp('Need to change aperture, the image with high shutter speed is dark.')
    NewAper = StanValAper(j-1)
else
    
i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
break;
end

j=j-1;
end
   



newAper=StanValAper(NewAper);




