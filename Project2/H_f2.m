function H=H_f2(x)
% reture 100X500 Mat

b=importdata('fun2_b.txt');
b=b';  % mX1-(500,1)

fid = fopen('fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid); % mXn (500,100)

H=A'*diag(1./((b-A*x+1e-8).^2))*A;  % (100,100)


end
