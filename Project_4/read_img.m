function  image=read_img
% read image data from file att_faces

image=[];
path='att_faces/';

for i= 1:40
    for j=1:10
        location=strcat(path,'s',string(i),'/',string(j),'.pgm');
        im=imread(location);
        im=reshape(im,112*92,1);
        image=[image im];
        fclose all;
    end
end

