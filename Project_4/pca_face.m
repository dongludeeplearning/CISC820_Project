function  pca_face(data)

data=double(data);
[P,s,X_new,per]=PCA(data,1);

%visualize mean value
m=mean(data,2);
I=reshape(m,112,92);
imshow(I,[min(m),max(m)]);

pause;

%visualize PC (eigen vector )
for i=1:5    
    subplot(1,5,i);
    I =reshape(P(:,i),112,92);
    imshow(I, [min(P(:,i)), max(P(:,i))]);
end

pause;

% visualize top_n pc
% Change n to control the number of PCs;

n=117;
y=P(:,1:n)*X_new(1:n,:)+m*ones(1, size(data,2));
str =sprintf('%d%s',n,'pc');

%figure;
%title(str);
for i=1:5
    subplot(2,5,i);
    I =reshape(y(:,i),112,92);
    imshow(I, [min(y(:,i)), max(y(:,i))]);
    title(str);
end
 