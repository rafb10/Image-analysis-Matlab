close all;
clear all;

image1 = imread('bart.bmp');

figure(1)
subplot(1,2,1)
imshow(image1);
subplot(1,2,2)
imhist(image1);

[Xsize Ysize] = size(image1);

for i = 1:Xsize

      for j = 1:Ysize

                if(image1(i,j)> 190 & image1(i,j)< 215)
                     image1(i,j) = 255;
                else
                     image1(i,j) = 0;
         
                end
      end          
end

figure(2);
imshow(bartB);
