n=length(X);
d=zeros(n);
d(:,1)=Y;
disp(d)
for j=2:n
    for i=1:n-j+1
        d(i,j)=d(i+1,j-1)-d(i,j-1);
    end
end
disp(d)