clc;
clear all;
close all;
textinput='IF_YOU_MUST_CROSS_A_COURSE_CROSS_COW_ACROSS_A_CROWDED_COW_CROSSING,_CROSS_THE_CROSS_COARSE_COW_ACROSS_THE_CROWDED_COW_CROSSING_CAREFULLY.';
symbol={',','.','A','C','D','E','F','G','H','I','L','M','N','O','R','S','T','U','W','Y','_'};
for i=1:length(symbol)
Prob(i)=(length(strfind(textinput,symbol(i))));
end
Prob=sort(Prob,'descend');
Z=zeros(length(Prob),1);
for i=1:length(Prob)
Z(i,1)=Prob(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Function for splitting the Matrix into two with equal probability%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [A,B] = SF(Prob)
S1=Prob(1);
S2=sum(Prob);
i=1;
while S1<S2
        S1=sum(Prob(1:i));
        S2=sum(Prob(i+1:end));
        i=i+1;
end
flag1=abs(sum(Prob(1:i-2))-(sum(Prob(i-1:end))));
flag2=abs(sum(Prob(1:i-1))-sum(Prob(i:end)));
if flag1<flag2
A=(Prob(1:i-2)');
B=(Prob(i-1:end)');
else
A=(Prob(1:i-1)');
B=(Prob(i:end)');    
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Another function using the previous function to do the same recursively%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function [Z] = Shannon(Z)
k=1;
while k<100
    if (length(find(Z(:,k)~=0))~=1)||(all(M(x))~=0)
        x=Z(:,k)~=0;
        M=Z(:,k);
        while(sum(M(x))==0)||(length(M(M~=0))==1)
            k=k+1;
            x=Z(:,k)~=0;
            M=Z(:,k);         
        end
        [A, B]=SF(M(x));
        for i=1:length(A)
            Z(i,2*k)=A(i);
        end
        for i=1:length(B)
            Z(i,2*k+1)=B(i);
        end
    else
        k=k+1;
        x=Z(:,k)~=0;
        M=Z(:,k);
        [A, B]=SF(M(x));
        for i=1:length(A)
            Z(i,2*k)=A(i);
        end
        for i=1:length(B)
            Z(i,2*k+1)=B(i);
        end
    end
k=k+1;
end
 
for l=1:length(Z)
    if sum(Z(:,l))==0
    A(l)=l;
    end
end
A=A(A~=0);
Z(:,A)=[];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
Results=[Prob' Z];
disp(Results)