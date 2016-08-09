clear all; close all; clc
%FFT Lecture 5.13.1
L=4;

n=512;
% domain
x2=linspace(-L/2,L/2,n+1); %n+1 because you need to have the last point same as first point
x=x2(1:n);

%u=exp(-x.^2);

%FFT of u
%ut=fft(u);
%plot(abs(ut)) %This shit is fucked. Needs a shift
%utt=fftshift(ut)

%plot(ut) % trying to solve by butterfly algorithm and it fucks it all up should look like a gaussian
%plot(abs(utt))

%%%%%%%%%%%15.2 TAKING DERIVS WITH FT
%L=4 fucks with the periodic BC, causes oscillations near discont

u=sech(x); % Hyperbolic sec
ud=-sech(x).*tanh(x);% How close can we come to these. u and ud

k=(2*pi/L)*[0:(n/2-1) (-n/2):-1]; %need to shift k are wave values

%need to rescale to L thats 2pi/L, the shift is accounted for by going from
%0 to n/2-1 then going from the other way
ut=fft(u);
u1dt= 1i*(k.*ut);
u1d=ifft(u1dt);


plot(x,u,'k', x, ud, 'm', x, u1d, 'go') 

