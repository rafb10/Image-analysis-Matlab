clear all;
close all;
% 1) Basic local binarization
riceImage = imread('rice.png');

[Xsize Ysize] = size(riceImage);
riceCopy = riceImage;

for i = 1:Xsize

      for j = 1:Ysize

                 mean = meanLT(i,j,15,riceImage,Xsize,Ysize);
                 if(riceImage(i,j) > mean)
                     riceCopy(i,j) = 255;   %black
                 else
                     riceCopy(i,j) = 0;     %white
                 end
         end
end

figure(1)
subplot(1,2,1)
imshow(riceImage);
subplot(1,2,2)
imshow(riceCopy);


catalogue = imread('katalog.bmp');

[Xsize2 Ysize2] = size(catalogue);
catalogueCopy = catalogue;
for i = 1:Xsize2

      for j = 1:Ysize2

                 mean2 = meanLT(i,j,15,catalogue,Xsize2,Ysize2);
                 if(catalogue(i,j) > mean2)
                     catalogueCopy(i,j) = 255;      %black
                 else
                     catalogueCopy(i,j) = 0;        %white
                 end
      end
end
figure(2)
subplot(1,2,1)
imshow(catalogue);
subplot(1,2,2)
imshow(catalogueCopy);



% Local binarization using standard deviation



riceImage2 = imread('rice.png');
riceCopy2 = riceImage2;

k = 0.15;       % factors
R = 128;

for i = 1:Xsize

      for j = 1:Ysize

                 mean = meanLT(i,j,15,riceImage2,Xsize,Ysize);
                 T = mean*(1-k*((stddev(i,j,15,riceImage2,mean,Xsize,Ysize)/R)-1));
                 if(riceImage2(i,j) > T)
                     riceCopy2(i,j) = 255;
                 else
                     riceCopy2(i,j) = 0;
                 end
         end
end
figure(3)
subplot(1,2,1)
imshow(riceImage2);
subplot(1,2,2)
imshow(riceCopy2);

catalogue2 = imread('katalog.bmp');
catalogueCopy2 = catalogue2;

k = 0.15;   % factors
R = 128;

for i = 1:Xsize2

      for j = 1:Ysize2

                 mean2 = meanLT(i,j,15,catalogue2,Xsize2,Ysize2);
                 T = mean2*(1+k*((stddev(i,j,15,catalogue2,mean2,Xsize2,Ysize2)/R)-1));
                 if(catalogue2(i,j) > T)
                     catalogueCopy2(i,j) = 255;
                 else
                     catalogueCopy2(i,j) = 0;
                 end
         end
end

figure(4)
subplot(1,2,1)
imshow(catalogue2);
subplot(1,2,2)
imshow(catalogueCopy2);

