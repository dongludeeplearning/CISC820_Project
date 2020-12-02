function n =per_detection(per)

for i =1 :400
    tper(i)=sum(per(1:i));   
    if tper(i)>0.90
       n=i;
       break;
    end
end

% 0.95 --n=190
% 0.9 --- n=111
% per_train  n=88