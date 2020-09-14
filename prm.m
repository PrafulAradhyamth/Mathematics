A= input ('enter a number\n');
disp(A)
B=factor(A);
c=length(B);
if c<2
    fprintf('A is prime number\n')
else
    fprintf('A is not a prime number\n')
end
fprintf('lets check using the built in function')
isprime(A)