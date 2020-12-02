function Kmeans_test_lab=Kmeans(train,test)


[P_train, s_train, X_new_train, per_train] = PCA (train, 1);
[P_test, s_test, X_test, per_test] = PCA (test, 1);
%An improved/weighted KMeans 

m=mean(train,2);
train=double(train)-m;

k=20;
Feat=P_train(:,1:k)'*double(train) ;
Feat=Feat';
cen_dict=[];
lab=[];

% first compute the center
for i=1:35
    cen=mean(Feat(1+(i-1)*8:8+(i-1)*8, :));
    cen_dict=[cen_dict; cen];
    lab(i)=i;
end

mm=mean(test,2);
test=double(test)-mm;
test_Feat=P_test(:,1:k)'*double(test);
test_Feat=test_Feat';

% comoute distance and choose the nearest center label
for m=1:length(test_Feat)
    
    for n=1:35
        dist=(test_Feat(m,:)-cen_dict(n,:)).^2;
        distance(n)=sum(dist.*per_test(1:k));  % add weights for distance
       
    end
    [v(m),Kmeans_test_lab(m)]=min(distance);
        
end



