function [final_x, final_y, iter_y, k] = general_optimize(f,g,H,x_0,N, delta1, c, alpha,rho,choice,special)

%choice: method number 12345   
%special: default special=0 except you want test the second function
%special


if nargin <= 10
    special = 0;
    
end
k = 1;
count = 0;
n = size(x_0,1);
step = 0;
x_k = x_0;
x_k1 = x_0;
init_a = alpha;
iter_y = zeros(1,10000);
F = eye(size(x_0,1));
fid = fopen('fun2_A.txt','r');
A = fscanf(fid,'%e ',[500,100]);
fclose(fid);
fid = fopen('fun2_b.txt','r');
b = fscanf(fid,'%e ',[500,1]);
fclose(fid);



% comopute direction p 

while(k<=N && ((k==1)|| step>delta1))
    pre_x = x_k;
    x_k = x_k1;
    if choice == 1
        % gradient descent
        p = -g(x_k);
        
        
    elseif choice == 2       
        % newton
        p = -H(x_k)\g(x_k);
        
            
    elseif choice == 3
        % quasi-newton               
        if(k>1)
                yk = g(x_k) - g(pre_x);
                sk = x_k - pre_x;
                F = F + yk'*((F*yk+sk)/(yk'*sk)^2)*(sk*sk')-(sk*yk'*F+F*yk*sk')/(yk'*sk);
                p = -F*g(x_k);
        else
                p = -F*g(x_k);
         
        end
    
    elseif choice == 4
        % Mewton Method with Modified Hessian
        E=(abs(min(eig(H(x_k))))+1e-3)*eye(n);
        p=(H(x_k)+E)\(-g(x_k)); 
        
    else
        % conjugate gradient method
        if count == n
            count = 0;
        end
        
        if(count>0)
                p = -g(x_k) + norm(g(x_k))/norm(g(pre_x))*pre_p;
                pre_p = p;
        else
                p = -g(x_k);
                pre_p = p;
        end
        
    end
    
% bakctracking linesearch --alpha: stepsize
    alpha = init_a;
    while(alpha>0)        
        if special==2
            if (f(x_k+alpha*p) > f(x_k) + alpha*c*p'*g(x_k))||(~all(A*(x_k+alpha*p)-b<0))
                alpha = alpha * rho;
            else
                break;
            end
        else
            if f(x_k+alpha*p) > f(x_k) + alpha*c*p'*g(x_k)
                alpha = alpha * rho;
            else
                break;
            end
       
        end       
    end

% move forward
    x_k1 = x_k + alpha*p;
    step = norm(x_k1 - x_k)^2;
    
    iter_y(k) = f(x_k);    
    count = count + 1;
    k = k + 1;
    
end

k = k - 1;

figure('name','Iteration Performance');
plot(1:k,iter_y(1:k),'r-o');
xlabel('Iterations');
ylabel('Function Value ');


final_x = x_k;
final_y = f(x_k);

end