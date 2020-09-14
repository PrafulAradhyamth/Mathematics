function [  ] = backward( X,Y,x)
n=length(X);
d=zeros(n);
d(:,1)=Y;
for j=2:n
    for i=j:n
        d(i,j)=d(i,j-1)-d(i-1,j-1);
    end
end
fprintf('Backward difference is \n')
disp(d)
D=d(n,:);
disp(D)
P=1;
F=D(1);
syms x
p=(x-X(n))/(X(2)-X(1));
for l=2:n;
    P=P*((p+(l-2))/(l-1));
    F=F+P*D(l);
end
g=expand(F);
fprintf('the backward interpolated polynomial is\n')
disp(g)
x=X(1):0.001:X(n);
v=eval(g);
plot(x,v,'r',X,Y,'*')
hold on 
x=input('enter a number where to evaluate');
disp(x)
k=eval(g);
fprintf('the value of polynomial at x is \t');
disp(k)
end
