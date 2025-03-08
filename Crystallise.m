%Copy paste your Crystallise function implementation below.
%You do not have to include your FindClosest implementation.
function [crystallised_image] = Crystallise(rgb_image, row_co, column_co)
% Crystallise.m function applies a frosted window or mosaicilike filter to
% the input image.
% Input:
% RGB_Image An 𝑚-by-𝑛-by-3 uint8 array representing an RGB image.
% Row_Co, A 1-by-𝑛 double array representing the row co-ordinates of each crystal.
% Column_Co,A 1-by-𝑛 double array representing the column co-ordinates of each crystal
% Output:
% Crystallised_Image, An 𝑚-by-𝑛-by-3 uint8 array representing the crystallised image.
% Author: Hargun Singh 

% size function determines the size of the input RGB_Image
[rows, cols, colours] = size(rgb_image);

% zeros function is used to create an empty array of 0 with same number of
% rows and columns as input RGB image
crystallised_image = zeros(rows, cols, colours, 'uint8');

% for loop is used to iterate over each row and column of the input image
for i = 1:rows
    for j = 1:cols
        % FindClosest function is used here to find the location of the
        % closest pixel
         closest_pixel = FindClosest([i,j], row_co , column_co);
        % Replaces the colour of the pixel with closest crystal colour
         crystallised_image(i,j,:) = rgb_image(closest_pixel(1), closest_pixel(2), :);
    end
end
end