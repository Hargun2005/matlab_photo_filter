%Copy paste your FindClosest function implementation below.
function [closest_pixel] = FindClosest(vector, row_co, column_co)
% FindClosest.m, given a pixel position, finds the closest pixel from the
% given row and column co-ordinates.
% Input:
%      vector, A 1-by-2 double vector representing the position of a pixel.
%      row_Co, A 1-by-𝑛 double array representing the row co-ordinates of a set of pixels.
%      column_Co, A 1-by-𝑛 double array representing the column co-ordinates of a set of pixels.
% Output:
%     closest_pixel, A 1-by-2 double vector representing the position of the closest pixel co-ordinates to the
%     input position.
% Author: Hargun Singh

% assigns the value at Vector index 1 and 2 to P1 and P2 respectively
p1 = vector(1);
p2 = vector(2);

% defines the length of Row co-ordinates
n = length(row_co);

% creates an empty 1D array of zeros of same length as Row co-ordinates
Distance = zeros(1,n);

% for loop used to iterate over every index of Row and Column co-ordinates 
for i = 1:n
    % the value at index i in Row co-ordinate is assigned to Q1
    q1 = row_co(i); 
    % the value at index i in Column co-ordinate is assigned to Q2
    q2 = column_co(i); 
    % the distance between pixels is calculated as their euclidean distance from one another and the resultant is stored in the 1D array of distance at index i
    Distance(i) = sqrt((q1 - p1)^2 + (q2 - p2)^2); 
end

% min function is used to access the index number at which the minimum value is stored in
% the 1D array of Distance
[~,i] = min(Distance);
% index number is used to define which values from Row and Column
% co-ordinates when subsituted in the formula gave the minimum distance and
% hence represent the closest pixel position
closest_pixel = [row_co(i), column_co(i)];
% converts the Closest_Pixel data into double data type. 
closest_pixel = double(closest_pixel);
end