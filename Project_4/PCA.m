function [P, s, X_new, per] = PCA (data, type)

%type=1, svd
%type=2, eigen

[feature_n, sample_n]= size(data);
%data=data-mean(data,2)*ones(1,sample_n);
data=double(data)-mean(data,2)*ones(1,sample_n);

if type==1
    data_n=data/sqrt(sample_n-1);
    [U,S,~]=svd(data_n);
    
    s=diag(S);
    tv=sum(s.^2);
    
    for i=1:length(s)
        per(i)=s(i)^2/tv; 
        tper(i)=sum(per(1:i));       
    end
    
    P=U;
    plot(tper,'o');
    pause;
    
    
elseif type==2
    var_data= data*data'./(sample_n-1);
    [U,D]=eig(var_data);
    s=diag(D);
    
    [s,idx]=sort(s,'descend');
    tv=sum(s);
    U=U(:,idx);
    
    for i=1:length(s)
        per(i)=s(i)/tv;
    end
    
    P=U;
    plot(per,'o');
    pause;
    
end
X_new=P'*data; 
    

end