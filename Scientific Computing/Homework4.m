%Homework 4
clear all; close all; clc

m=64; L=10;
n=m*m;
x2=linspace(-L,L,m+1);
x=x2(1:m);
del=mean(diff(x));
t_step=0.001
tspan=0:t_step:4;

% first make a vector of ones this makes the full diagonals
e1=ones(n,1);
e0=zeros(n,1);
%now occasional 1 and 0's
e2=e1;
e4=e0;

for j=1:m
    e2(m*j)=0;
    e4(m*j)=1;
end

e3(2:n,1)=e2(1:n-1,1); %shifts the whole thing down one
e3(1,1)=e2(n,1);%completes shift

%shift e4 down
e5(2:n,1)=e4(1:n-1); e5(1,1)=e4(n,1);

A=spdiags([e1 e1 e5 e2 -4*e1 e3 e4 e1 e1],[-(n-m) -m -m+1 -1  0 1 m-1 m (n-m)],n,n);% a sparse diagonal matrix, the identity matrix
A(1,1)=2;
A=A./del^2;


%Set up B and C

e1=ones(n,1);

B=spdiags([e1 -e1 e1 -e1],[-(n-m) -m m (n-m) ],n,n);%
B=B./(2*del);
%###################################B
e1=ones(n,1);
e0=zeros(n,1);
e2=e1;
e5=e0;
e6=e0;
for j=1:m;
    e2(m*j)=0;
    e5(m*j)=1;
end

e4=-e2;
e3(2:n,1)=e2(1:n-1,1); %shifts the whole thing down one
e3(1,1)=e2(n,1);%completes shift

e6(2:n,1)=e5(1:n-1,1);
e6(1,1)=e5(n,1);

C=spdiags([e6 e4 e0 e3 -e5],[ -m+1 -1  0 1 (m-1) ],n,n);   % a sparse diagonal matrix, the identity matrix
C=C./(2*del);
%#############################C

w_ans=zeros(9,n);
y=x;
[X,Y]=meshgrid(x,y);

v=0.001;

w=exp(-X.^2-(Y.^2)/20);%IC
w3D(1,:,:)=w;
w_1=reshape(w,n,1);
w_ans(1,:)=w_1;

z=1;
for i=1:(max(size(tspan))-1)
strm=(w_1')/A;
strm_t=strm';
    
[t,w_new]=ode45('A4rhs',[tspan(i), tspan(i+1)],w_1,'',A,B,C,v,strm_t,[]);
w_1=w_new(max(size(t)),:);

if (mod(tspan(i+1),0.5)==0)
z=z+1;
w_ans(z,:)=w_1(:);
w_re=reshape(w_ans(z,:),m,m);
w3D(z,:,:)=w_re(:,:);
end


w_1=w_1';
end

for j=1:9
    w3D(j,32,32)
    
    subplot(3,3,j)
    wview(:,:)=w3D(j,:,:);
    pcolor(X,Y,wview);
    shading interp
    xlabel('x'); ylabel('y');
    s=sprintf('w at t = %2.3f',tspan((5/(t_step*10))*(j-1)+1));
    title({s},'fontsize',12);
end




%Now time step
%wt=v*(A*w_1')-(B*strm').*((C*w_1'))+(C*strm').*((B*w_1'));







