function y = get_corrected(ab_points,ks)


r_sq = sum(ab_points.^2);
r_sqsq = r_sq.^2;
x_corrected = ab_points.* repmat(1 + ks(1)*r_sq + ks(2)*r_sqsq, [2,1]);
x_corrected(3,:) = 1;
y = x_corrected;



end