function [Traj,Fmin] = Quasi_Newton_F(f,g,N,E,c,x)
% BFGS

pos=x;
n=size(x,1);
Traj=zeros(n,N);
Traj(:,1)=pos;
F0=eye(n);

for i=1:N
    
    if i==1
        B=F0; 
    else 
        y=g(pos)-g(Traj(:,i-1));
        s=pos-Traj(:,i-1);
        temp=((y'*(F0*y+s))/(y'*s)^2)*(s*s')-((s*y'*F0+F0*y*s')/(y'*s));
        B=F0+temp;   
        F0=B;
    end
       
    p= -B*g(pos);    
    stepsize=linesearch(pos,p,c,f,g);
    pos=pos+stepsize*p;
    Traj(:,i+1)=pos;
    Fmin=f(pos);
    
    
    if abs(f(Traj(:,i))-f(Traj(:,i+1)))<=E  % converge 
       break
    end     
end

end