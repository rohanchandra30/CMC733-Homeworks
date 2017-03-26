function y = get_ideal(x_corrected,K)
x_ideal_ = K*x_corrected;
x_ideal = x_ideal_(1:2,:) ./ repmat(x_ideal_(3,:), [2,1]);

y = x_ideal;


end