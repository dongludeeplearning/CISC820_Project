# Project2
Optimization Project for CISC820

If you'd like to run this project, please follow the two steps, it's simple and easy. :)

# 1 Test the Given function
run the parameter configuration file to prepare the initial parameter configuration for this project.
## For function1, run test1.m.
## For function2, run test2.m.
## For function3, run test3.m.

# 2 Test Five Methods 
run this command in the command window
##[x, y, ~, k]=general_optimize(f,g,H,x_0,N, delta1, c, alpha,rho,choice,special)
##[x, y, ~, k]=general_optimize(@f_**function number(1,2,3)**,@g_**function number(1,2,3)**,@h_**function number(1,2,3)**,x_0,N,delta1,c,alpha,rho,**method number(1,2,3,4,5)**,**special(0,2)**)

method1 : gradient descent
method2 : newton
method3 : quasi-newton
method4 : newton with modified hessian
method5 : conjugate gradient descent

Eg: To test five methods you can run as follows:
[x, y, ~, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N,delta1,c,alpha,rho,1,0)
[x, y, ~, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N,delta1,c,alpha,rho,2,0)
[x, y, ~, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N,delta1,c,alpha,rho,3,0)
[x, y, ~, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N,delta1,c,alpha,rho,4,0)
[x, y, ~, k] = general_optimize(@f_1,@g_1,@h_1,x_0,N,delta1,c,alpha,rho,5,0)

However, if you want test fun2 pls set last parameter (special) as 2,
[x, y, ~, k] = general_optimize(@f_2,@g_2,@h_2,x_0,N,delta1,c,alpha,rho,1,2)

The function numbers correspond to the function numbers in Project Description document.  
