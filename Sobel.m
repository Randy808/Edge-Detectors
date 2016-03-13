
%read in image
I = imread('C:/Users/Randy/Desktop/mood.jpg');
pkg load image;
I = rgb2gray(I);

%Blur it with average blur
avgBlur = ones(10)./100;
%Or blur it with a gaussBlur =  fspecial('gaussian',80); % but not part of algorithm
I2 = conv2(double(I),avgBlur,'same');
%imshow(uint8(I2));


%Get derivative with respect to each variable/direction
dx = conv2(I2,[1 0 -1],'same');
dy = conv2(I2,[1; 0; -1],'same');

%Get magnitude
mag = sqrt(dx.^2 + dy.^2);
threshold = 5;
mag(find(mag<threshold)) = 255;
imshow(uint8(mag));
