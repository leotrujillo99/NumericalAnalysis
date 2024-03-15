function [x] = backsub(U, y)
% This code will solve an upper triangular matrix using back substitution
% and return the result as x. This code will start its loops from the
% bottom element of the U matrix

[m, n] = size(U); % This will get the size of the matrix U that is passed in

x = zeros(m, 1); % This will create a matrix with the size of U to return values
    for i = m:-1:1 % This loop will iterate trough the rows of the U matrix
        % starting from the bottom row
        x(i) = (y(i) - U(i, i+1:m) * x(i+1:m)) / U(i, i); % This will calculate 
        % the solution of the current row based on the values that were
        % calculate before. 
    end
end