clear all; close all;clc;


init=bvpinit(linspace(1,3,10),[0 0]) %chops the space into 10 points and makes the initial guesses 0.  This is the most difficult part.
sol=bvp4c(@bvp_rhs,@bvp_bc,init); % using a 4th order scheme. @bvp_rhs is the right hand side of the equations. @bcp_bc is the bc functions. init is your guess
%now we need to plot our data

x=linspace(1,3,100);
BS=deval(sol,x); %deval will interpret the output of bvp4c (the sol variable)
plot(x,BS);

%first column of sol is the function y and the second is y'.