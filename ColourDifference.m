%Copy paste your ColourDifference function implementation below.
function [double_array] = ColourDifference(array_1,array_2)
% ColourDifference.m function , given two m-by-n-by-3 arrays, will calculate
% the euclidean difference in colour between respective pixels in the two
% arrays.
% Input:
%    array_1, An 𝑚-by-𝑛-by-3 uint8 array representing one array of colours.
%    array_2, An 𝑚-by-𝑛-by-3 uint8 array representing a second array of colours.
% Output:
%    double_array, An 𝑚-by-𝑛 array of doubles representing the euclidean difference in colour between corre-
%    sponding pixels of the inputs.
% Author: Hargun Singh

% size function is used to determine the number of rows, columns and
% colours in array 1. Both array 1 and array 2 are of same size
[~, ~, ~] = size(array_1);
[rows, columns, ~] = size(array_2);

% zeros function is used to create an empty array of same number of rows
% and columns in output Double_array as input arrays1,2
double_array = zeros(rows,columns);

% array_1 and array_2 data type is converted into double data type
array_1 = double(array_1);
array_2 = double(array_2);

% for loop is used to iterate over evry pixel in each row and coloum of
% each colour layer
for i = 1:rows
    for j = 1:columns
        for k = 1:3
            % finds the difference between colour of two pixels using euclidean distance and resultant is stored in the ith row and jth column of the Double Array 
            double_array(i,j) = sqrt(((array_1(i,j,1) - array_2(i,j,1)))^2 + (array_1(i,j,2) - array_2(i,j,2))^2 + (array_1(i,j,3)-array_2(i,j,3))^2); 
        end
    end
end
end