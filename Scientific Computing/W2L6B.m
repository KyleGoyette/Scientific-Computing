clear all; close all;clc;

beta=99
init=bvpinit(linspace(-1,1,50),@bc_init,beta) %chops the space into 10 points and makes the initial guesses 0.  This is the most difficult part.
sol=bvp4c(@bvp_rhsB,@bvp_bcB,init); % using a 4th order scheme. @bvp_rhs is the right hand side of the equations. @bcp_bc is the bc functions. init is your guess
%now we need to plot our data

x=linspace(-1,1,100);
BS=deval(sol,x); %deval will interpret the output of bvp4c (the sol variable)
plot(x,BS(1,:));

%first column of sol is the function y and the second is y'.