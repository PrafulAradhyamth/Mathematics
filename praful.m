function [  ] = praful( T,S )
n=length(T);
Z=zeros(n);
Z(:,1)=S;
t=T(1):0.001:T(n);
syms t
p=((t-T(1))/T(2)-T(1));
for j=2:n
    for i=j:n
        Z(i,j)=Z(i,j-1)-Z(i-1,j-1);
    end
end
fprintf('Forward difference is \n')
disp(Z)
D=diag(Z); 
pro=1;
f=D(1);
for k=2:n
    pro=pro*((p-k+2)/(k-1));
    f=f+((D(k))*(pro));
end
fprintf('The interpolated polynomial is \n');
g=expand(f);
disp(g)
plot(T,S,'*')
hold on
t=T(1):0.001:T(n);
w=eval(g);
plot(t,w,'r');
end

