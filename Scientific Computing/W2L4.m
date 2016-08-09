clc;
hold on
tol=10^(-4);
xspan=[-1 1];
A=1;
ic=[0 A];
beta=99

for jj=1:15;
    dbeta=1
for j=1:100;
    [t,y]=ode45('testrhs',xspan,ic,[], beta);
    if abs(y(end,1))<tol
        break
    end
    
    if y(end,1)*((-1)^(jj+1))>0
        beta=beta-dbeta;
    else
        beta=beta+dbeta/2;
        dbeta=dbeta/2;
    end
end
beta
beta=beta-1
plot(t,y(:,1));
end


