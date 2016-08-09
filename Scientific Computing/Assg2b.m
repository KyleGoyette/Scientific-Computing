clc;
clear all;
close all;
hold on
tol=10^(-3);
TOL=10^(-3);
xspan=[-2 2];
A=1;
eigen=1;
ic=[A -sqrt(2*2-eigen)*A];
B45=zeros(7,1);
B113=zeros(7,1);
B23=zeros(7,1);
B15s=zeros(7,1);
C=zeros(7,1);
deigen=0.1;
for jj=1:7;
    tol=tol*(10^(-1));
    TOL=TOL*10^(-1);
    C(jj)=TOL;
    ic=[A sqrt(2*2-1)*A];
    
    OPTIONS=odeset('RelTol',TOL,'AbsTol',TOL);
    [t,y]=ode45('A2brhs',xspan,ic,OPTIONS);
    t_diff=diff(t);
    t_mean=mean(t_diff)
    B45(jj)=t_mean;
    
    
    ic=[A sqrt(2*2-1)*A];
    [t,y]=ode23('A2brhs',xspan,ic,OPTIONS);
    t_diff=diff(t);
    t_mean=mean(t_diff)
    B23(jj)=t_mean;
    
    ic=[A sqrt(2*2-1)*A];
    [t,y]=ode113('A2brhs',xspan,ic,OPTIONS);
    t_diff=diff(t);
    t_mean=mean(t_diff)
    B113(jj)=t_mean;
    
        
    ic=[A sqrt(2*2-1)*A];
    [t,y]=ode15s('A2brhs',xspan,ic,OPTIONS);
    t_diff=diff(t);
    t_mean=mean(t_diff)
    B15s(jj)=t_mean;

end
B45
B113
p45=polyfit(log10(B45),log10(C),1)
p113=polyfit(log10(B113),log10(C),1)
p23=polyfit(log10(B23),log10(C),1)
p15s=polyfit(log10(B15s),log10(C),1)

plot(log10(B113),log10(C),'go',log10(B45),log10(C),'m*',log10(B23),log10(C),'b+',log10(B15s),log10(C),'rx')
legend('ODE113','ODE45','ODE23','ODE15s')
% errspan=linspace(5,-3,0)
% f=polyval(p45,errspan);
% plot(errspan,f,'b:')
%log10(C),log10(B45),'m:',log10(C),log10(B113),'g')
