function bc=bvp_bc(yl,yr)
%can specify intermediate points in the middle
bc=[yl(1)-3; yr(1)+2*yr(2)-5]

%note yl and yr are the vectors at the boundary points. the first
%number in the vector is the function and second column is the derivative

end
