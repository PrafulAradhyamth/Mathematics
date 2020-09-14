in=randi(255,4);
Z=in(:);

actual=0:255;
A=actual(~isprime(actual));
pixie=256:1620;
B=pixie(isprime(pixie));
for i=1:202
    Z(Z==A(i))=B(i);
end
C=[actual(isprime(actual)) pixie(isprime(pixie))];
for i=1:256
    for j=1:256
        D(i+j-1)=C(i)+C(j)
    end
end
% n=length(Z);
% Z1=Z(1:n/2,1);
% Z2=Z(n/2+1:end,1);
% Z3=Z1.*Z2
%%
a=imread('7.png');
a1=double(a(:,:,1));
a2=double(a(:,:,2));
a3=double(a(:,:,3));
grey=uint8(floor(0.3*a1+0.59*a2+0.11*a3));
imshow(grey)
b1=(a1(1)/double(grey(1)));
b2=a2(1)/double(grey(1));
b3=a3(1)/double(grey(1));
C=zeros(256,256,3);
C(:,:,1)=grey/0.3;
C(:,:,2)=grey/0.59;
C(:,:,3)=grey/0.11;
imshow(uint8(C))