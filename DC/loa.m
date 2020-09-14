fs = 1e3;
t = 0:1/fs:1;
x = [1 2]*sin(2*pi*[50 250]'.*t) + randn(size(t))/10;
%x is your output from the modulated signal
%here im just using it for explaination
demodulated=conv(x,[1/2,1/2]);
plot(demodulated)