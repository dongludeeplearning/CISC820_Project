function y=f1(x)
% sum(i*x_i^2)

for i=1:100
    y(i)=i*(x(i)^2);
end

y=sum(y);