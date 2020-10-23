function [Traj,Fmin] = Quasi_Newton_C(f,g,N,E,c,x)
% DFP  less recommended 

pos=x;
n=size(x,1);
Traj=zeros(n,N);
Traj(:,1)=pos;
B0=diag(ones(n,1));

for i=1:N
    
    if i==1
        B=B0; 
    else 
        y=g(pos)-g(Traj(:,i-1));
        s=pos-Traj(:,i-1);
        temp=((B0*(y*y')*B0)/(y'*B0*y))-((s*s')/(y'*s));
        B=B0-temp;   
        B0=B;
    end
       
    p= -B*g(pos);    
    stepsize=linesearch(pos,p,c,f,g);
    pos=pos+stepsize*p;
    Traj(:,i+1)=pos;
    
    if abs(f(Traj(:,i))-f(Traj(:,i+1)))<=E  % converge 
       break
    end    
end

end