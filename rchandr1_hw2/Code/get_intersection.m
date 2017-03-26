function [x,y] =get_intersection(m1, m2, c1, c2)

x = (c2 - c1)/(m1-m2);
y = (m1*c2 - c1*m2)/(m1 - m2);

end