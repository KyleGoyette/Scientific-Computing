clear all; close all; clc


m=4;
n=m*m; %5x5 matrix for our data, discretization in x and y

% first make a vector of ones this makes the full diagonals
e1=ones(n,1);

B=spdiags([e1 -e1 e1 -e1],[-(n-m) -m m (n-m) ],n,n);

%spy(B)