%Copy paste your Blur function implementation below.
function blurred_image = Blur(image, intensity)
% Blur.m blurs the supplied image (RGB or greyscale) by finding an average
% of the pixel colours surrounding each pixel.
% Input:
%     Image, An 𝑚-by-𝑛-by-𝑘 uint8 array representing an RGB or greyscale image
%     Intensity, A positive, odd, integer that defines the intensity of the blurring
% Output:
%     Blurred_Image, An 𝑚-by-𝑛-by-𝑘 uint8 array representing the blurred image.
% Author: Hargun Singh


% size function determines the number of rows, columns and colour layers in
% the input image. 
[rows, columns, colours] = size(image);

% zeros function is used to create an empty array of zeros of the same size
% as the input image
blurred_image = zeros( rows, columns, colours, 'uint8');

% How_Far determins how many steps to the right, left, top and bottom must
% be moved from the center pixel in order to create a square. 
how_far = (intensity -1) / 2 ;

% for loop is used to iterate over the rows and columns of the input image
for i = 1:rows
    for j = 1:columns
        % used max and min to ensure that the square never goes out of bounds and if it does only the values in the square are used
        % if index plus how far exceeds the number of rows then row_finish
        % is the number of rows and same applies to column_max and
        % column_finish
        row_max = max(1, i - how_far); 
        row_finish = min(rows, i + how_far); 
        column_max = max(1, j - how_far);
        column_finish = min(columns, j + how_far);
        
        % for loop iterates over each colour layer
        for k = 1:colours
            % this determines the boundary of each square i.e which row will it start and which row will it end and same for the columns
            pixel_square = image(row_max:row_finish, column_max:column_finish, k); 
            % Pixel_square values are converted into uint8 data type to avoid errors in arithmetic operation
            pixel_square = double(pixel_square); 
            % average of the values in the square is calulated using mean function
            average = mean(pixel_square(:)); 
            % average value is converted back into uint 8 after the calculation
            average = uint8(average);
            % average value is assigned to the ith row, jth column and kth layer of the blurred image
            blurred_image(i,j,k) = average; 
        end
    end
end
blurred_image = uint8(blurred_image);
imshow(blurred_image)
end


