%Copy paste your Invert function implementation below.
function [inverted_image] = Invert(image)
% Invert.m converts the supplied RGB or Greyscale image to its opposite
% colours and returns the inverted image.
% Input:
%  Image, an m-by-n-by-k uint8 array representing an RGB or greyscale
%  colour image
% Output:
%  Inverted_Image, an m-by-n-by-k uint8 array representing the inverted
%  image
% Author: Hargun Singh

% size function is used to determine the number of rows, columns and
% colours in the input image
[rows, cols, colours] = size(image);

% zeros function is used to create and empty array of zeros of same size as
% the input image. 
inverted_image = zeros(rows, cols, colours, 'uint8');

% for loop iterate over each pixel in every row, column and colour layer of
% the input image
for i = 1:rows
    for j = 1:cols
        for k = 1:colours
            inverted_image(i,j,k) = 255 - image(i,j,k); % calculates the opposite colour value for each pixe in the image by subtracting it from 255 and the resultant is the inverted pixel for the inverted image
        end
    end
end
inverted_image = uint8(inverted_image); % converts the data type of Inverted_Image to uint8
imshow(inverted_image)
end