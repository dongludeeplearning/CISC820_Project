function [Traj,Fmin] = Newton(f,g,H,N,E,c,x)

pos=x;
n=length(x);
Traj=zeros(n,N);
Traj(:,1)=pos;

for i=1:N
    p=H(pos)\(-g(pos)) ;   % x = A\B 对线性方程组 A*x = B 求解
    stepsize=linesearch(pos,p,c,f,g);
    pos=pos+stepsize*p;
    Traj(:,i+1)=pos;
    
    if abs(f(Traj(:,i))-f(Traj(:,i+1)))<=E  % converge 
       Fmin=f(pos);
       break
    else
       Fmin=f(pos);
    end     
end

end
    