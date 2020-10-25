function KK=test_rho
% test how rho affect iterations

KK=[];
for i= 1:9   
    
    x_0 = repmat(20,[100,1]);
    N = 5000;
    delta1 = 1e-10;
    c = 0.1*i;
    rho = 0.5;
    alpha = 1;
    [final_x, final_y, iter_y, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N, delta1, c, alpha,rho,5,1);
    KK=[KK k];
end

 plot([1:9],KK);