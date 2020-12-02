function [t_dist, pred]=face_recognition(image, testImg)

% set testImg as follow:
% real_imge=image[:,1]
% fake_image=rand(10304,1);

data=double(image);
[P,s,X_new,per]=PCA(image,1);

mm=mean(image,2);

k=10;
test=double(testImg)-mm;
test_Img=P(:,1:k)'*double(test);
test_mean=P(:,1:k)'*double(mm);

dist = abs(test_Img-test_mean);
t_dist=sum(dist);
threshold= 33274;  % the max value of 400 distances

if t_dist> threshold
    pred=0;
else 
    pred=1;
end
