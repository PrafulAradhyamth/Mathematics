function []=lss1(A,B)
sz= size(A);
augM= [A B]; 
rA= rank(A);
rM= rank(augM);
nu=sz(2);
if rank(A)==rank(augM)
    fprintf('The system is consistent\n');
    fprintf('Rank of A is %d',rA);
if rank(A)==nu
   fprintf('Given system has unique solution\n'); 
X = A\B;
disp(X)
else
   fprintf('The system is infinite solution');
disp(rref(augM))
end
else
   fprintf('The rank of A =%d\t and rank of [A B]=%d\n',rA,rM);  
fprintf('The system is inconsistent\n');
end
end
