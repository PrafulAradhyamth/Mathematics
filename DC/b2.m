for variance=1:10
%modulation
bitsize=10000;
A=randi([0 1],[1,bitsize]);
A(A==0)=-1;
S1=A(1:2:end); % odd  bits
S2=A(2:2:end); % even bits
dataout=[S1' S2'];
%noise addition
mean=0;
noi=mean+sqrt(variance)*(randn(1,bitsize));
n1=noi(1:2:end); % odd  bits of noise
n2=noi(2:2:end); % even bits of noise
awgn=[n1' n2'];
%transmitted
recievedata=dataout+awgn;
scatterplot(recievedata)
%demodulation 
recievedata(recievedata>0)=1;
recievedata(recievedata<=0)=-1;
err=length(find(dataout~=recievedata));
BER(variance)=err/bitsize;
%snr is inversly proportinal to variance
SNR(variance)=1/variance;
end
plot(SNR,BER)
figure
scatterplot(recievedata)
