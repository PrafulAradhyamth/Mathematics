function [  ] = limca( x0 )
f=@(x) exp(-x)-(3*log(x));
df=@(x) -exp(-x)-3*(x.^-1);
tol=0.00000001;
maxitr=100;
x=zeros(1,maxitr);
x(1)=x0;
for i=1:maxitr
    x(i+1)=x(i)-(f(x(i))/df(x(i)));
end
err=abs(x(i+1)-x(i));
if abs(df(x(i)))<0.00001
    fprintf('the derivative is zero that is nr fails\n')
elseif err<tol && f(x(i+1))<0.0001
    fprintf('the root of function is %f\n',x(i+1))    
elseif i==maxitr
    fprintf('the function is divergent\n')
end
disp(x(i+1))
t=-6:0.001:5;
y=f(t);
plot(t,y)
hold on
plot(x(i+1),0,'*')
grid
end