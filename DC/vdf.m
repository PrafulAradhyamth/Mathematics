var=0.001:0.1:10;
for i=1:length(var)
len=10000;
s=randi([0 1],[1,len]);
s(s==0)=-1;

s1=s(1:len/2);
s2=s((len/2)+1:len);
datain=s1+sqrt(-1).*s2;
noi=sqrt(var(i)).*(randn(1,len/2)+sqrt(-1).*randn(1,len/2));
recin=datain+noi;
%scatterplot(recin)
x1=real(recin);
x2=imag(recin);
recin=[x1, x2];
recin(recin>0)=1;
recin(recin<=0)=-1;
temp=length(find(s~=recin));
BER(i)=temp/len;
SNR(i)=10*log10(1/var(i));
end
semilogy(SNR,BER)