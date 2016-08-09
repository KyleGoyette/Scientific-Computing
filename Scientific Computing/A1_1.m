clc;
clear all;
close all;
hold on
tol=10^(-6);
xspan=[-4 4];
A=1;
eigen=0;
ic=[A sqrt(4*4-eigen)*A];

deigen=0.1;
for jj=1:5;
    deigen=0.01;
    ic=[A sqrt(4*4-eigen)*A];
    eigen=eigen+deigen;
for j=1:10000;
    [t,y]=ode45('A1rhs',xspan,ic,[], eigen);
    if abs(y(end,1))<tol
        break
    end
    
    if y(end,1)*((-1)^(jj+1))>0
        eigen=eigen+deigen;
    else
        eigen=eigen-deigen/2;
        deigen=deigen/2;
    end
end
plot(t,y(:,1));
eigen
end