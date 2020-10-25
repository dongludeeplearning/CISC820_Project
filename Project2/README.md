# Project2
Optimization Project for CISC820

If you'd like to run this project, please follow the two steps, it's simple and easy. :)

# 1
run the parameter configuration file to prepare the best practiced parameter configuration for this project.
## For function1, run test1.m.
## For function2, run test2.m.
## For function3, run test3.m.

# 2
run this command in the command window
## [x, y, ~, k] = general_optimize(@f_**function number(1,2,3)**,@g_**function number(1,2,3)**,@h_**function number(1,2,3)**,x_0,N,delta1,c,alpha,rho,**method number(1,2,3,4)**,**function number(1,2,3)**)

method1 : gradient descent
method2 : newton
method3 : quasi-newton
method4 : newton with modified Hessian
method5 : conjugate gradient descent

Eg:To test the first function using the five methods
[final_x, final_y, iter_y, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N, delta1, c, alpha,rho,1,1)
[final_x, final_y, iter_y, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N, delta1, c, alpha,rho,2,1)
[final_x, final_y, iter_y, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N, delta1, c, alpha,rho,3,1)
[final_x, final_y, iter_y, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N, delta1, c, alpha,rho,4,1)
[final_x, final_y, iter_y, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N, delta1, c, alpha,rho,5,1)



The function numbers correspond to the function numbers in Project Description document.  
