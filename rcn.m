function [  ] = rcn( A )
c=length(A);
r=rank(A);
n=c-r;
fprintf('The nullity of matrix A is\n')
disp(n)
if n==0
   fprintf('The nullity of matrix A is zero\n') 
else
    fprintf('The null space of matrix A is  \n')
    disp(null(A,'r'))
end
[d,p]=rref(A);
fprintf('reduced row echolon form of A is  \n')
disp(d)
fprintf('the pivot elements are in coloumn %d \n',p)
for k=1:r
    ro=d(k,:);
    fprintf('R%d the row basis of matrix A is  \n',k)
    disp(ro)
end
for i=1:length(p)
    co=A(:,p(i));
    fprintf('C%d the coloumn basis of matrix A is \n',i)
    disp(co)    
end
end