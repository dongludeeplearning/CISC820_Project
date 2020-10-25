function y = f_2(x)
% function2 
% input x should be in 100 by N form

fid = fopen('fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);
fid = fopen('fun2_b.txt','r');
b = fscanf(fid,'%e ',[500,1]);
fclose(fid);
fid = fopen('fun2_c.txt','r');
c = fscanf(fid,'%e ',[100,1]);
fclose(fid);


y = c'*x-sum(log(b-A*x));

end