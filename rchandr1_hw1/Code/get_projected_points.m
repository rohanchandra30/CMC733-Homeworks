function y = get_projected_points(H,X)



xp = H*X';
xh = xp(1:2,:)./repmat(xp(3,:), [2,1]);


y = xh;


end