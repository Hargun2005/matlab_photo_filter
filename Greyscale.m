%Copy paste your Greyscale function implementation below.
function [greyscale_image] = Greyscale(rgb_image)
% Greyscale.m converts the supplied RGB colour image to a greyscale version
% by applying a ratio of colours for each pixel.
% Input:
%   RGB_Image, An m-by-n-ny-3 uint8 array representing an RGB colour image
% Output:
%  Greyscale_Image, An m-by-n-by-1 uint8 array representing a greyscale
%  image
% Author: Hargun Singh

% size function is used to define the number of rows, columns and channels
% in the input image
[rows, cols, colours] = size(rgb_image);

% zero function is used to create rows and columns of same size as
% RGB_Image filled with 0's
greyscale_image = zeros(rows, cols, 'uint8');

% double function is used to convert the input RGB_Image data type to
% double data type to avoid errors in aritmetic operations
rgb_image = double(rgb_image);

% for loop is used to iterate over every row, column and colour of the
% input RGB_Image
for i = 1:rows
    for j = 1:cols
        for k = 1:colours
            r = 3/9; % sets the ratio of red colour to 3/9
            g = 5/9; % sets the ratio of green colour to 5/9
            b = 1/9;  % sets the ratio of blue colour to 1/9
            greyscale_image(i,j) = r * rgb_image(i,j,1) + g * rgb_image(i,j,2) + b * rgb_image(i,j,3); % each pixel in the red, blue and green colour layer is multiplied by their ratios and their sum will be a pixel for Greyscale_Image
        end
    end
end
greyscale_image = uint8(greyscale_image);% converts the data type of greyscale image to uint8
imshow(greyscale_image)
end