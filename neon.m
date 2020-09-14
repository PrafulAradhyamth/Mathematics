function [  ] = neon( x0 )
f=@(x) exp(x).*sin(x)-1;
df=@(x) exp(x).*(sin(x)+cos(x));
TOL=0.00000001;
maxitr=100;
x=zeros(1,maxitr);
x(1)=x0;
for i=1:maxitr
    if abs(df(x(1)))< 0.0001
        fprintf('derivative zero newton rapson method fails');
        break;
    else
        x(i+1)=x(i)-(f(x(i))/df(x(i)));
        err=x(i+1)-x(i);
        if err<TOL && abs(f(x(i)))<0.0001
            fprintf('iteration %d\t root %f\t err %f\t value of function %f\n',i,x(i+1),err,f(x(i)))
            fprintf('Desired root is %f\n',x(i+1))
            break;
        end
    end
end
if i==maxitr
    fprintf('nr method is not convergent\n');
else
    t=1:0.001:5;
    y=f(t);
    plot(t,y)
    hold on
    plot(x(i+1),0,'*');
end 
end
