%
% This program (script) is meant to test your genp, backsub and forsub
% programs.  It constructs an Ax=b in such a way that we know
% the exact solution up to a very small error (can you see how?).
%
% The matrix A is the kind of matrix for which G.E.N.P. (no row
% interchanges) is backward stable.  That means your LU is the
% exact LU factorization of a matrix very close to A, and your x
% is the exact solution to a system very close to Ax=b.
% On the other hand A is a very illconditioned matrix, so you
% should not expect || x - truex || / || truex || to be very small.
% So expect || LU - A || / || A || and || b - Ax || / || b ||
% to be on the order of 1e-16 (our machine epsilon is about 10^{-16} = 1e-16),
% but || x - truex || / || truex || to be around 1e-8.
%
% We randomly generate some data in this test, so don't expect
% the same results each time you run this.
%
% You run this code from the command line (in the command window) like this:
% >> NLAProg2Test
%
% It will create the file prog2run.txt (which you print out and also email me,
% along with genp.m, forsub.m and backsub.m).
% 
% good luck...

  if exist('prog2run.txt','file')==2, delete('prog2run.txt'); end
  diary prog2run.txt
  n=8;  A = hilb(n);
  disp(['The condition number of A is ',num2str(cond(A),'%0.4e')])
  [LnU] = genp(A);  L = eye(n) + tril(LnU,-1);  U = triu(LnU);
  luerr = norm(A-L*U);
  disp(['|| A - LU || / || A || =  ',num2str(luerr/norm(A))])
  truex = randn(n,1);  b = A*truex;
  y = forsub(L,b);  x = backsub(U,y);  r = b - A*x;
  disp(['|| x - truex ||/|| truex || = ',num2str(norm(x-truex)/norm(truex))])
  disp(['|| b - Ax ||/|| b || = ',num2str(norm(r)/norm(b))])
  diary off
