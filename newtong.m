function [  ] = newtong( X,Y )
n=length(X);
d=zeros(n);
d(:,1)=Y;
for j=2:n
    for i=j:n
        d(i,j)=d(i,j-1)-d(i-1,j-1);
    end
end
fprintf('forward difference is \n')
disp(d)
syms x
p=(x-X(1))/(X(2)-X(1));
O=diag(d);
F=O(1);
P=1;
for l=2:n;
    P=P*((p-(l-2))/(l-1));
    F=F+P*O(l);
end
fprintf('the interpolated polynomial is \n');
g=expand(F);
disp(g)
x=X(1):0.01:X(n);
w=eval(F);
plot(x,w,'r');
hold on 
plot(X,Y,'*') 
end

