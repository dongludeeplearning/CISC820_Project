function  Knn_test_lab= KNNclassifer(train,test)

[P_train, s_train, X_new_train, per_train] = PCA (train, 1);
[P_test, s_test, X_test, per_test] = PCA (test, 1);

m=mean(train,2);
train=double(train)-m;

k=20;
Feat=P_train(:,1:k)'*double(train) ;
Feat=Feat';

%get train label 
ylab=[];
l=ones(1,8);
for c=1:35
    ylab=[ylab c*l];
end


mm=mean(test,2);
test=double(test)-mm;
test_Feat=P_test(:,1:k)'*double(test);
test_Feat=test_Feat';

% compute the distance and return top K result
topk=5;
test_lab=[];
for i= 1:120
    for j=1:280
        dist(j)=sum((test_Feat(i,:)-Feat(j,:)).^2);   % L2 distance  280*50
    end
    [D,idx]=sort(dist);
    label=ylab(idx);
    D_topk=label(1:topk);
    DD=tabulate(D_topk);
    
    [maxCount,Knn_test_lab(i)]=max(DD(:,2));
end

%[maxCount,idx_testlab] = max(tabulate(index)(:,2))　

