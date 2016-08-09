function rhs = A1rhs(x, ic, dummy, eigen )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
y1=ic(1);
y2=ic(2);
rhs=[y2; (x^2-eigen)*y1];
end