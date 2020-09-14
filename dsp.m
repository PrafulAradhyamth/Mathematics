function [  ] = dsp( X,Y )
n=length(X);
d=zeros(n);
d(:,1)=Y;
syms x
p=(x-X(1))/(X(2)-X(1));
for j=2:n
    for i=j:n
        d(i,j)=d(i,j-1)-d(i-1,j-1);
    end
end
fprintf('forward difference is \n')
disp(d)
O=diag(d);
k=O(1);
for l=2:n;
    u=1;
    u=u*(p-(l-2));
    k=k+(O(l))*(1/factorial(l+1))*(u);
end



end

