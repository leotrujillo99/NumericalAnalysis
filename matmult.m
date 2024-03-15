function C = matmult(A,B)
% This code will compute the product C = AB with A ∈ Rm×n,B ∈ Rn×p.
% It will do this by using for loops to go trough each scalar element
% of the arrays and multiplying them to create the matrix C. It will 
% also check if the numbers of columns for A is equal to the number of
% of rows in B. If these two sizes are no  equivalent it will return an
% error.

[m,n]=size(A); % This determines the size of A
[l,p]=size(B); % This determines the size of B 
if(n~=l) % This will test if the columns of A are equal to the rows of B
    disp('Error: The columns of A are not equal to the rows of B'); % This 
                                                                 % is the
                                                                 % error
                                                                 % message
    return
end
C=zeros(m,p); % This will create an empty matrix of zeros with size mxp
    for i=1:m; % This will look trough every row of th  A matrix
        for j=1:p; % This will look trough every column of the B 
            for q=1:n; % This will look trough every element of the row of
                        % A that we are in. i.e. every column of A
                C(i,j)=C(i,j)+ A(i,q)*B(q,j); % This is the mutiplication 
                                           % of each element of the row by
                                           % an element of the column and
                                           % adding them together.
            end            
        end
    end
end