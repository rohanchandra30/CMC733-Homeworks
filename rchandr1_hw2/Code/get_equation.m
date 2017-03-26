function [m,c] = get_equation(x)


d = diff(x);

m = d(2)/d(1);
c = x(1,2) - m*x(1,1);




end