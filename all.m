function [  ] = all( x0 )
f=@(x) exp(x).*sin(x)-1;
df=@(x) exp(x).*(cos(x)-sin(x));
tol=0.00001;
maxitr=100;
x(1)=x0;
for i=1:maxitr
    x(i+1)=x(i)-(f(x(i))/df(x(i)));
if err==abs(x(i+1)-x(i))<tol
    fprintf('the root of function is %f',x(i+1))    
end 
disp(x(i+1))
t=1:0.001:5;
y=exp(t).*sin(t)-1;
plot(t,y)
hold on
plot(x(i+1),0,'d')
end

