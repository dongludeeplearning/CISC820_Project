function stepsize=linesearch(x,p,c,f,g)

rho=0.5;
stepsize=1;

while f(x+stepsize*p)>f(x)+ c*stepsize*p'*g(x)
    stepsize=rho*stepsize ;
end
    
end
