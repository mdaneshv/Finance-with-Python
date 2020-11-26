function [v] = v(x)
c=4;
v=((x<=0).*0)+((x>0 & x<c).*x./c+((x>=c).*(1)));
%v=1-exp(-a*x);
end






