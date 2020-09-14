var=0.01:0.1:20;
for i=1:length(var)
    va=var(i);
    len=50000;
    s=randi([1 4],1,len);
    sk=s;
    s(s==1)=-3;
    s(s==2)=-1;
    s(s==3)=1;
    s(s==4)=3;
s1=s(1:len/2);
s2=s((len/2)+1:len);
datain=s1+sqrt(-1).*s2;

noi=sqrt(va).*(randn(size(datain))+sqrt(-1).*randn(size(datain)));
recin=datain+noi;
        x1=real(recin);
        x2=imag(recin);
det=[x1, x2];
det(det<=-2)=-3;
det(-2<det & det<=0)=-1;
det(0<det & det<=2)=1;
det(det>2)=3;

temp=find(sk~=det);
BER(i)=length(temp)/len;
SNR(i) = 10*log10(va);
end
semilogy(SNR,BER)