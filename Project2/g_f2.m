function dy=g_f2(x)


b=importdata('fun2_b.txt');
b=b';  % mX1-(500,1)
c=importdata('fun2_c.txt');
c=c';  % nX1-(100,1)
fid = fopen('fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid); % mXn (500,100)


dy=c+A'*(1./(b-A*x));
%Ey=exp(c'*x)/sum(b-A*x);
%dy=(c+A'*(1./(b-A*x)))*Ey;
end