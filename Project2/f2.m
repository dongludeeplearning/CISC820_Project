function y=f2(x)
%y=c'*x - sum(log(b-A*x));


b=importdata('fun2_b.txt');
b=b';  % mX1-(500,1)
c=importdata('fun2_c.txt');
c=c';  % nX1-(100,1)
fid = fopen('fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid); % mXn (500,100)

%y=c'*x - sum(log(b-A*x));
y=exp(c'*x)/sum(b-A*x);
y=log(y+1e-8);
end