function me = MACHEPS
%
% MACHEPS approximates the machine epsilon, me.
%
% No input data needed.
%
% me is defined to be the smallest positive float that satisfies
%
%             fl(1 + me) > 1,
%
% We let m be a variable that converges to me from above,
% so we will start m out big and then begin cutting it in half;
% at each step we will test to see if  fl(1+m) > 1.
% If the test fails (that is, if fl(1+m) == 1) then m is one
% iteration too small, so we approximate me by 2m.

m = 1.0;    % start m out big (way too big, one might argue...)
t = 1.0 + m;     % we will test the condition fl(1+m) > 1 using the variable t
while t > 1.0,   % this is the test
  m = m/2;       % if it passed the test, then m still is >= mu, so we halve m
  t = 1.0 + m;   % we use the temp variable t to force 1+m to be stored as float
end
me = 2*m;        % if we get here, then m failed the test, which makes m
                 % smaller than mu, so we set me = 2m.
