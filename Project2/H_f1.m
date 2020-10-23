function H=H_f1(x)
n=length(x);
H=zeros(n,n);

for i=1:100
    H(i,i)=2*i;
end
