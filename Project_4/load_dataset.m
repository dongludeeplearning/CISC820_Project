function [train,test]=load_dataset

train=[];
test=[];
path='att_faces/';

% get train data
for i= 1:35
    for j=1:8
        location=strcat(path,'s',string(i),'/',string(j),'.pgm');
        im=imread(location);
        im=reshape(im,112*92,1);
        train=[train im];
        fclose all;
    end
end

% get test data

for i= 1:35
    for j=9:10
        location=strcat(path,'s',string(i),'/',string(j),'.pgm');
        im=imread(location);
        im=reshape(im,112*92,1);
        test=[test im];
        fclose all;
    end
end

for i= 36:40
    for j=1:10
        location=strcat(path,'s',string(i),'/',string(j),'.pgm');
        im=imread(location);
        im=reshape(im,112*92,1);
        test=[test im];
        fclose all;
    end
end



