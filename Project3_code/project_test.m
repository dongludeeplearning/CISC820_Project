function project_test(sample_no)
for f=1:10
        for N=[10 100 1000 10000]
        %for N=100000
            count=0;
            mean_ep=0;
            for reps=1:10000
                if sample_no == 1
                    X = sample_normal(N,1,0);
                    mu=0;
                elseif sample_no == 2
                    X= sample_bernoulli(N,0.5); 
                    mu= 0.5;
                else                      
                    X= sample_uniform(N,0,1);
                    mu= 0.5;
                end
                
                Xbar=mean(X);          
                [a,b]=ci(X,f);
                
                ep=0.5*(b-a);
                mean_ep=mean_ep+ep/10000;
                
                if abs(Xbar-mu)<=ep
                     count=count+1;
                end            
            end
            
        fprintf ('fun: %5d  N: %5d ep %1.3f frac missed: %1.3f\n ' , ...
       f,N,mean_ep, 1-count/10000);
       end
   
end
