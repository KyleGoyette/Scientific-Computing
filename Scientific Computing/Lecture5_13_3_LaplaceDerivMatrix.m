clear all; close all; clc


m=5;
n=m*m; %5x5 matrix for our data, discretization in x and y

% first make a vector of ones this makes the full diagonals
e1=ones(n,1);
e0=zeros(n,1);
%now occasional 1 and 0's
e2=e1
e4=e0

for j=1:m
    e2(m*j)=0;
    e4(m*j)=1;
end

e3(2:n,1)=e2(1:n-1,1); %shifts the whole thing down one
e3(1,1)=e2(n,1);%completes shift

%shift e4 down
e5(2:n,1)=e4(1:n-1); e5(1,1)=e4(n,1);

A=spdiags([e1 e1 e5 e2 -4*e1 e3 e4 e1 e1],[-(n-m) -m -m+1 -1  0 1 m-1 m (n-m)],n,n)   % a sparse diagonal matrix, the identity matrix


%cond(A)  %very large so its totally singular cant divide.
%spy(A)




