%Copy paste your TwoTone function implementation below.

function [twotoned_image] = TwoTone(rgb_image, rgb_colours, rgb_weightings)
% TwoTone.m coverts image to use only two different colours
% Input:
%      rgb_image, An 𝑚-by-𝑛-by-3 uint8 array representing an RGB image.
%      rgb_colours, A 1-by-2-by-3 uint8 array representing two RGB pixel colours to be used in the output
%      image.
%      rgb_Weightings, A 1-by-2-by-3 uint8 array representing two RGB pixel colours to be used as weightings for
%      determining which output colour to apply.
% Output:
%      An 𝑚-by-𝑛-by-3 uint8 array representing the two toned output image.
% Author: Hargun Singh

% size function is used to determine number of rows, columns and layers in
% the input RGB_Image
[rows, cols,~] = size(rgb_image);

% double function is used to convert RGB_Image
% array to double data type to avoid mistake in arithemetic
% operations
rgb_image = double(rgb_image);


% RGB_weightings(1,1,:) referred to as low, is typically a colour closer to black
low = rgb_weightings(1,1,:);
%weightings(1,2,:) referred to as high, is typically a colour closer to white.
high = rgb_weightings(1,2,:);

% zero function is used to create an empty array if zeros of same numbers
% of rows and columns as input RGB_Image
twotoned_image = zeros(rows, cols, 3, 'uint8');

% for loop is used to iterate over each row, column and layer of the
% RGB_Image
for i = 1:rows
    for j = 1:cols
            if ColourDifference(rgb_image(i,j,:), low) < ColourDifference(rgb_image(i,j,:), high)% if condition ensures that if the colour difference between all the pixels in RGB_image and low is less than the colour difference betwwen all pixels and high then the colour is closer to low
                twotoned_image(i,j,1:3) = rgb_colours(1,1,:); % if Colour difference is closer to low then TwoToned image is assigned ColourA which is RGB_Colours(1,1,:)
            elseif ColourDifference(rgb_image(i,j,:), low) == ColourDifference(rgb_image(i,j,:), high) 
                twotoned_image(i,j,1:3) = rgb_colours(1,1,:); % if colour difference is same then TwoToned image is assigned ColourA
            else 
                twotoned_image(i,j,1:3) = rgb_colours(1,2,:); % if colour difference between low and all pixels in Rgb-image is greater than high colour difference then that means colour is closer to colour B which is RGB_Colours(1,2,:)
            end
     end
    twotoned_image = uint8(twotoned_image); % TwoToned_Image data type converted back to uint8 type
end
end