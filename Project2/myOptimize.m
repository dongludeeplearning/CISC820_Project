%% Rui Li reference 

function myOptimize()
clear all; close all; clc
​
% polynomial fun
myPoly=@(x)[1,10]*x.^2;
pGrad=@(x)[2;20].*x;
pHess=@(x)[2,0;0,20];
​
figure; hold on
[X1 X2]=meshgrid(-60:.1:60,-60:.1:60);
Y=[X1(:),X2(:)].^2*[1;10];
contour(X1,X2,reshape(Y,size(X1)),30)
​
[X1 X2]=meshgrid(-60:5:60,-60:5:60);
G=[X1(:),X2(:)].*repmat([2,20],length(X1(:)),1);
quiver(X1,X2,reshape(G(:,1),size(X1)),reshape(G(:,2),size(X1)))
​
% disp('For the polynomial function example:')
% [X1 X2]=meshgrid(-10:1:10,-10:1:10);
% X=[X1(:),X2(:)]';
% errorGrad=0;
% for i=1:size(X,2)
%     errorGrad=errorGrad+norm(pGrad(X(:,i))-numGrad(myPoly,X(:,i)));
% end
% disp(['Gradient error is ' num2str(mean(errorGrad))]);
% errorHess=0;
% for i=1:size(X,2)
%     errorHess=errorHess+sum(norm(pHess(X(:,i)))-norm(numHess(myPoly,X(:,i))));
% end
% disp(['Hessian error is ' num2str(mean(errorHess))]);
​
% gradient descent
iter=50;
stepsize=0.08;
initPos=[50;50];
Traj=zeros(2,iter);
pos=initPos;
Traj(:,1)=initPos;
for i=1:iter-1
    pos=pos-stepsize*pGrad(pos);
    Traj(:,i+1)=pos;
end
plot(Traj(1,:),Traj(2,:),'r-o')
​
​
% gradient desecent with back-tracking line search
btTraj=zeros(2,iter);
pos=initPos;
btTraj(:,1)=initPos;
for i=1:iter-1
    p=-pGrad(pos);
    stepsize=btLineSearch(myPoly,pGrad,p,pos);
    pos=pos+stepsize*p;
    btTraj(:,i+1)=pos;
end
plot(btTraj(1,:),btTraj(2,:),'k-o')
% 
% 
% % Newton's method
% btTraj=zeros(2,iter);
% pos=initPos;
% btTraj(:,1)=initPos;
% for i=1:iter-1    
%     pos=pos-pHess(pos)\pGrad(pos);
%     btTraj(:,i+1)=pos;
% end
% plot(btTraj(1,:),btTraj(2,:),'g-o')
% 
% 
% % Quasi-Newton
% btTraj=zeros(2,iter);
% pos=initPos;
% btTraj(:,1)=initPos;
% B=eye(length(pos));
% for i=1:iter-1    
%     pre_pos=pos;
%     p=-B\pGrad(pre_pos);
%     step=btLineSearch(myPoly,pGrad,p,pre_pos);
%     pos=pos+step*p;
%     
%     dx=step*p;
%     dg=pGrad(pos)-pGrad(pre_pos);
%     B=B-(B*dx*dx'*B)/(dx'*B*dx)+(dg*dg')/(dg'*dx);
%     btTraj(:,i+1)=pos;
% end
% plot(btTraj(1,:),btTraj(2,:),'b-o')
​
​
% exponential fun
A=[1,3;1,-3;-1,0];
myExp=@(x)sum(exp(A*x-0.1));
eGrad=@(x)A'*exp(A*x-0.1);
eHess=@(x)A'*diag(exp(A*x-0.1))*A;
​
figure; hold on
[X1 X2]=meshgrid(-3.5:.1:2,-1.5:.1:1.5);
Y=sum(exp([X1(:),X2(:)]*A'-0.1),2);
contour(X1,X2,reshape(Y,size(X1)),100)
​
​
% [X1 X2]=meshgrid(-2:.1:2,-1:.1:1);
% G=exp([X1(:),X2(:)]*A'-0.1)*A;
% quiver(X1,X2,reshape(G(:,1),size(X1)),reshape(G(:,2),size(X1)))
​
% disp('For the exponential function example:')
% [X1 X2]=meshgrid(-2:.1:2,-1:.1:1);
% X=[X1(:),X2(:)]';
% errorGrad=0;
% for i=1:size(X,2)
%     errorGrad=errorGrad+norm(eGrad(X(:,i))-numGrad(myExp,X(:,i)));
% end
% disp(['Gradient error is ' num2str(mean(errorGrad))]);
% errorHess=0;
% for i=1:size(X,2)
%     errorHess=errorHess+sum(sum(eHess(X(:,i))-numHess(myExp,X(:,i))));
% end
% disp(['Hessian error is ' num2str(mean(errorHess))]);
​
​
% gradient descent
iter=50;
stepsize=0.005;
initPos=[2;1];
Traj=zeros(2,iter);
pos=initPos;
Traj(:,1)=initPos;
for i=1:iter-1
    pos=pos-stepsize*eGrad(pos);
    Traj(:,i+1)=pos;
end
plot(Traj(1,:),Traj(2,:),'g-o')
​
​
% gradient descent with back-tracking line search 
btTraj=zeros(2,iter);
pos=initPos;
btTraj(:,1)=initPos;
for i=1:iter-1
    p=-eGrad(pos);
    stepsize=btLineSearch(myExp,eGrad,p,pos);
    pos=pos+stepsize*p;
    btTraj(:,i+1)=pos;
end
plot(btTraj(1,:),btTraj(2,:),'k-o')
​
​
​
​
% % Newton's method
% btTraj=zeros(2,iter);
% pos=initPos;
% btTraj(:,1)=initPos;
% for i=1:iter-1    
%     pos=pos-eHess(pos)\eGrad(pos);
%     btTraj(:,i+1)=pos;
% end
% plot(btTraj(1,:),btTraj(2,:),'r-o')
% 
% 
% 
% legend('Obj','GD','momentum','adam','Newton','location','southwest')
​
​
% % Quasi-Newton
% btTraj=zeros(2,iter);
% pos=initPos;
% btTraj(:,1)=initPos;
% B=eye(length(pos));
% for i=1:iter-1    
%     pre_pos=pos;
%     p=-B\eGrad(pre_pos);
%     step=btLineSearch(myExp,eGrad,p,pre_pos);
%     pos=pos+step*p;
%     
%     dx=step*p;
%     dg=eGrad(pos)-eGrad(pre_pos);
%     B=B-(B*dx*dx'*B)/(dx'*B*dx)+(dg*dg')/(dg'*dx);
%     btTraj(:,i+1)=pos;
% end
% plot(btTraj(1,:),btTraj(2,:),'b-o')
% 
% tmpTraj=circshift(btTraj',1);
% conv=sum((tmpTraj-btTraj').^2,2);
% figure
% plot(conv(2:end))
% xlabel('Iteration')
% ylabel('|f(x_{t})-f(x_{t-1})|')
​
​
​
end
​
​
​
function step=btLineSearch(f,g,p,x)
step=1;
rho=.5;
c=.1;
​
while f(x+step*p)>f(x)+c*step*p'*g(x)
    step=rho*step;
end
​
end
​
​
​
function g=numGrad(f,x,order,h)
​
if nargin<3
    order=2;
end
​
if nargin<4
    h=sqrt(eps)*(norm(x,inf)+1);
end
​
xL=length(x);
xx=eye(xL);
g=zeros(xL,1);
​
if order==1
    for i=1:xL
        g(i)=(f(x+h*xx(:,i))-f(x))/h;
    end
else
    for i=1:xL
        g(i)=(f(x+h*xx(:,i))-f(x-h*xx(:,i)))/(2*h);
    end
end
​
end
​
​
function H=numHess(f,x,h,order)
​
if nargin<3
     h=sqrt(eps)*(norm(x,inf)+1);
end
​
if nargin<4
   order=2;
end
​
xL=length(x);
xx=eye(xL);
H=zeros(xL);
​
if order==1
    for i=1:xL
        H(:,i)=(numGrad(f,x+h*xx(:,i))-numGrad(f,x))/h;
    end
else
    for i=1:xL
        H(:,i)=(numGrad(f,x+h*xx(:,i))-numGrad(f,x-h*xx(:,i)))/(2*h);
    end
end
​
end