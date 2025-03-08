%Copy paste your Sketch function implementation below.
%You do not need to include your Greyscale, Invert or Blur function implementations.
function [sketch_image] = Sketch(image, intensity)
% Sketch.m takes an image and converts it into sketch-like drawing by using a combination
% of greyscale, inversion and blurring
% Input :
%   image, An m-by-n-by-k uint8 array representing an RGB or greyscale
%   colour image.
%   intensity, a positive, odd, integer that defines the intensity of the
%   sketch lines
% Output:
%  sketch_image, an m-by-n-by-1 uint8 array representing the sketch like image
% Author: Hargun Singh

% size function determines the number of rows, columns and channels 
% in the inout image
[rows, columns, ~] = size(image);

% used zero function to create a matrix of rows-by-columns which is same
% for both input and output image
sketch_image = zeros(rows, columns, 'uint8');

% Greyscale function is used to convert the input image into greyscale
% version
greyscale_version = Greyscale(image);

% Invert function creates an inverted version of the Greyscale_Version
inverted_version = Invert(greyscale_version);

% Blur function blurs the Inverted greyscale version
blur_inverted = Blur(inverted_version, intensity);

% double function is used to convert the Blur_Inverted and
% Greyscale_Version array to double data type to avoid errors in arithmetic
% operation
blur_inverted = double(blur_inverted);
greyscale_version = double(greyscale_version);

% iterates over each pixel in every rows and columns of Greyscale_Version and Blur_Inverted array 
for i = 1:rows
    for j = 1:columns
        % if statement ensures that whenever Greyscale version pixel has a
        % value of 255, sketch image pixel is assigned a value of 255 as
        % dividing a number by 0 gives an inappropriate answer
        if greyscale_version(i,j) == 255
            sketch_image(i,j) = 255;
        else
            % if greyscale version pixel is not 255 then this colour doge formula between Blur_Inverted and Greyscale version is applied to blend two images
            sketch_image(i,j) = (255 * (blur_inverted(i,j))) / (255 - greyscale_version(i,j)); 
        end
    end
    % Sketch_Image array data type is converted back into uint8 after doing the arithmetic operation
    sketch_image = uint8(sketch_image); 
end
imshow(sketch_image)
end

