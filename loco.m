function [  ] = loco( X,Y )
n=length(X);
d=zeros(n);
d(:,1)=Y;
x=X(1):0.01:X(n);
for j=2:n
    for i=1:n-j+1
        d(i,j)=d(i+1,j-1)-d(i,j-1);
    end
end
fprintf('Backward difference is \n')
disp(d)
syms x
p=(x-X(n))/(X(2)-X(1));
O=diag(d);
F=O(1);
P=1;
for l=2:n;
    P=P*((p-(l-2))/(l-1));
    F=F+P*O(l);
end
fprintf('The interpolated polynomial is \n');
g=expand(F);
disp(g)
end