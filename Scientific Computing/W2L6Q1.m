clear all; close all;clc;


init=bvpinit(linspace(0,1,10),@bc_initb); %chops the space into 10 points and makes the initial guesses 0.  This is the most difficult part.
sol=bvp4c(@bvp_rhsq1,@bvp_bcq1,init); % using a 4th order scheme. @bvp_rhs is the right hand side of the equations. @bcp_bc is the bc functions. init is your guess
%now we need to plot our data

x=linspace(0,1,100);
BS=deval(sol,x); %deval will interpret the output of bvp4c (the sol variable)
plot(x,BS);