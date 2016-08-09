function rhs = bvp_rhsq1(x,y)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
rhs=[y(2); cos(x)-y(2)*y(1)-y(1)^2];

end

