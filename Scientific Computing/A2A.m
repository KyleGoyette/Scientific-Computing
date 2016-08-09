clc; clear all; close all;
format long
L1=-4;
L2=4;
Ltot=L2-L1;
dx=0.1;
n=Ltot/dx

A=zeros(n+1);
for i=2:n+1;
            (L1+((i-1)*dx))
            A(i,i)=(L1+((i-1)*dx))^2+2/(dx^2);
            A(i,i-1) = (-1/dx^2);
            A(i-1,i)=-(1/dx^2);
end
A(1,1)=L1^2+(2/(3*dx^2));
A(1,2)=-(2/(3*dx^2));
A(n+1,n+1)=L2^2+(2/(3*dx^2));
A(n+1,n)=-(2/(3*dx^2));
B=A(3:80,3:80);
eps=eig(B);
eps=sort(eps);
eps(1:5)