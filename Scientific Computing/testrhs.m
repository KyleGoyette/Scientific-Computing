function rhs = testrhs(x, ic, dummy, beta )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
y1=ic(1);
y2=ic(2);
rhs=[y2; (beta-100)*y1];
end

