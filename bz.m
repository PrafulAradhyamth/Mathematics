function [  ] = bz( X,Y )
n=length(X);
d=zeros(n);
d(:,1)=Y;
for j=2:n
    for i=j:n
        d(i,j)=d(i,j-1)-d(i-1,j-1);
    end
end
fprintf('backward difference is \n')
disp(d)
syms x
p=(x-X(n))/(X(2)-X(1));
O=d(:,n);
F=O(1);
P=1;
for l=2:n;
    P=P*((p+(l-2))/(l-1));
    F=F+P*O(l);
end
fprintf('the interpolated polynomial is \n');
disp(F)
g=expand(F);
disp(g)
end