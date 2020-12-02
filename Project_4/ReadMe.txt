
# CISC820 Project4
# Dimensionality Reduction & Classification 

# get data 

Step0(not necessary): You can put the pictures file "att_facess" in your path and read data with read_img.m 
Run:  image=read_img;

Step1: An alternative way to load data is that directly load the FaceData.mat
Run:   load('FaceData.mat');


Step2: # PCA dimensionality reduction and Face Reconstruction 
Run:  pca_face(image)   


Step3:  Use PCA to recognize face
% set testImg as follow:
% real_imge=image[:,1]
% fake_image=rand(10304,1);

Run:[t_dist, pred]=face_recognition(image, testImg)

pred=1 means it is a face image;
pred=0 means it is not a face image;



Step4: Use PCA to classify face images

# load dataset     
Run :[train,test]=load_dataset (time-consuming, not recommend)
Run:  load('Train.mat'); load('Test.mat');    (time-saving, recommend)

# Kmeans Classification   
Run: Kmeans_test_lab=Kmeans(train,test)

# KNN  Classification  
Run: Knn_test_lab= KNNclassifer(train,test)  



