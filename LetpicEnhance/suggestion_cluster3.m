function [newAper NewShutter] = suggestion_cluster3(blur_content,image,contra)

StanValAper=[5 6.3 8 10 13 16 20]
NewAper = 3;




%intensity 230   5 6.3 8 10 13 16 20
p1=[0.0005462 0.0005887 -0.00007644 0.002607 0.001995 0.005362 0.007005];
p2=[-0.02538 -0.02556 0.008139 -0.1147 -0.08456 -0.2302 -0.3021];
p3=[0.3932 0.3689 -0.1873 1.679 1.196 3.299 4.35];
p4=[-2.027 -1.769 1.235 -8.175 -5.642 -15.76 -20.87];

% n=1
% if n==1
%     i=3;
%     y = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))
% end
%NewShutter = XXX(blur_content,p1,p2,p3,p4)

ChkFunctBlur=5;
blurvalue = (100*blur_content);
x = blurvalue-ChkFunctBlur;


i=3;
NewShutter = (p1(i)*(x^3)) + (p2(i)*(x^2)) + (p3(i)*(x)) + (p4(i))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Shutter_final = quantize_shutter(NewShutter);
NewShutter = Shutter_final ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%export this shutter speed
save('s1.text', 'NewShutter','-ASCII');
save('flag.text', 1, '-ASCII');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('flag.text', 0, '-ASCII');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

I= imread('E:\MT DNL\major project\Database V_2\Intensity=230\F=8\S0.0400_f8.jpg');
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

ChkFunctBlur=35;

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

I= imread('E:\MT DNL\major project\Database V_2\Intensity=230\F=8\S0.0100_f8.jpg');
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
ChkFunctBlur=32;
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




