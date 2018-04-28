close all;
clear all;
image = imread('indeks1.bmp');

subplot(1,3,1);
imshow(image,[]);

label =1;
linkTable = zeros(1,256);
[Xsize Ysize] = size(image);
label = 1;
for x = 1:Xsize-1
    for y = 1:Ysize-1
        if image(x,y) ~= 0
        neighbours= [image(x-1,y-1) image(x-1,y) image(x-1,y+1) image(x,y-1)];
        Sum = sum(neighbours);
        if Sum == 0
            image(x,y) = label;
            linkTable(label) = label;
            label = label+1;
            
        else
            neighbours = nonzeros(neighbours);
            Mn = min(neighbours);
            Mx = max(neighbours);
            image(x,y) = Mn;
            linkTable(Mx) = Mn;
        end
 
            
        end
    end
end

subplot(1,3,2);
imshow(image,[]);



for x= 2:Xsize
    for y = 2:Ysize
        if image(x,y)~=0
            image(x,y) = linkTable(image(x,y));
        end
    end
end

subplot(1,3,3);
imshow(image,[]);