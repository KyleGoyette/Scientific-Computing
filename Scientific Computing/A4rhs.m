function rhs = A4rhs(tspan,w,dummy,A,B,C,v,psi,d)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

rhs=(v*(A*w))-((B*psi).*((C*w)))+((C*psi).*((B*w)));
end

