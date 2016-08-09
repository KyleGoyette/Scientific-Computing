clear all; close all; clc


m=5;
n=m*m; %5x5 matrix for our data, discretization in x and y

% first make a vector of ones this makes the full diagonals
e1=ones(n,1);
e0=zeros(n,1);
e2=e1
e5=e0
e6=e0
for j=1:m;
    e2(m*j)=0;
    e5(m*j)=1
end

e4=-e2
e3(2:n,1)=e2(1:n-1,1); %shifts the whole thing down one
e3(1,1)=e2(n,1);%completes shift

e6(2:n,1)=e5(1:n-1,1);
e6(1,1)=e5(n,1);

C=spdiags([e6 e4 e0 e3 -e5],[ -m+1 -1  0 1 (m-1) ],n,n)   % a sparse diagonal matrix, the identity matrix


%spy(C)