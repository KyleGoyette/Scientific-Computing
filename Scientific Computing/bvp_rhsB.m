function rhs = bvp_rhsB(x,y,beta)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
rhs=[y(2); (beta-100)*y(1)-y(1)^3];

end

