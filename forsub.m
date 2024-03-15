function [y] = forsub(L, b)
% This code will solve a lower triangular matrix using forward substitution
% and return the result as y. This code will start its loops from the
% top element of the L matrix

[m, n] = size(L); % This will get the size of the L matrix to use in the for loops

y = zeros(m, 1); %This will initialize a matrix y of one column with rows the
% size of L

  for i = 1:m % This will iterate through the rows of the matrix L
    y(i) = (b(i) - L(i, 1:i-1) * y(1:i-1)) / L(i, i); % This will calculate 
    % solution for each row of the L matrix
  end
end
