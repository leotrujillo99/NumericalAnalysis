function A = genp(A)
% This code will calculate LU factorization without pivoting. It will take
% an input matrix A and return a matrix A that has the LU
% factorization where the elements below the diagonal are the L matrix and
% the ones above and including the diagonal are the U matrix elements.

[m,n] = size(A); % This gets the size of the matrix to use in the for loops,
                 % it doesnt really matter since we are guaranteed to get
                 % an nxn matrix according to the homework prompt

  % The next loops will do the LU factorization
  for j = 1:m-1 % This first loop will iterate trough the columns of A
    for i = j+1:m % This second loop will iterate trough the rows oF A
      multiplier = A(i, j) / A(j, j); % This will calculate the multiplier
                                      % for the L matrix
      A(i, j:n) = A(i, j:n) - multiplier * A(j, j:n); % This will generate
      % the elements of the U matrix for every element below the diagonal
      % of the A matrix. It will also update that value into the A matrix
      A(i, j) = multiplier; % This will update the values of the matrix A 
      % with the multiplier that would go in the L matrix
    end
  end
end