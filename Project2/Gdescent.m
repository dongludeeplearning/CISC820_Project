function  [Traj,Fmin]=Gdescent(f,g,N,E,c,x)
% gradient descent with line search.

pos=x;
n=length(x);
Traj=zeros(n,N);
Traj(:,1)=pos;
Err=[f(pos)];  

for i=1:N
    p=-g(pos);
    stepsize=linesearch(pos,p,c,f,g);
    pos=pos+stepsize * p;
    Traj(:,i+1)=pos;
    Fmin=f(pos);
    Err=[Err abs(f(Traj(:,i))-f(Traj(:,i+1)))];
    
    if abs(f(Traj(:,i))-f(Traj(:,i+1)))<=E 
        l=i;% converge  
       break
    else
        l=N;
    end
end

plot([1:l],Err(1:l),'r-')

    