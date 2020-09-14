function [  ] = gta( A,B )
a=[A B];
r=rank(A);
ra=rank(a);
l=length(A);
if r==ra && ra==l
    fprintf('the system is consistent and has unique solution that is \n')
    disp(A\B)
elseif r==ra && ra<l
    fprintf ('the system is consistent and is having infinte solutions\n')
    disp(r)
    disp(ra)
    disp(l)
elseif r<ra
   fprintf ('the system is inconsistent therefore has no solutions\n')
end
end