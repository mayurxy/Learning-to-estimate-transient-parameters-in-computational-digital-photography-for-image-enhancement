function cont = contrast(im)

I = double(im);
[r c]=size(im)
vision=0;
k=1;
for i=1:10:r-96;
for j=1:10:c-128;
m1=max(max(I(i:i+95,j:j+127)));
m2=min(min(I(i:i+95,j:j+127)));
vision(k)=(m1-m2)/(m1);
k=k+1;
end;
end;
cont=mean(vision) 
