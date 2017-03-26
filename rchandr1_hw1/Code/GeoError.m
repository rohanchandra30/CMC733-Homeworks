function [error, f] = GeoError(x, X, ks, K, Rs, ts)
% Measure a geometric error
%
%   x:  2D points. n x 2 x N matrix, where n is the number of corners in
%   a checkerboard and N is the number of calibration images
%       
%   X:  3D points. n x 2 matrix, where n is the number of corners in a
%   checkerboard and assumes the points are on the Z=0 plane
%
%   K: a camera calibration matrix. 3 x 3 matrix.
%
%   Rs: rotation matrices. 3 x 3 x N matrix, where N is the number of calibration images. 
%
%   ts: translation vectors. 3 x 1 x N matrix, where N is the number of calibration images. 
%
%   ks: radial distortion parameters. 2 x 1 matrix, where ks(1) = k_1 and
%   ks(2) = k_2.
%

%% Your code goes here. H_without is the tranformation to get a and b. 

f = zeros(2, length(x(1,1,:)), length(x));

for i =1:13        
    H_withoutK(:,:,i) = cat(2,Rs(:,:,i),ts(:,:,i));

% Transforming world coordinates to homogenous form. Xh is just the
% homogenous form of X.
N = size(X,1);
Xh = cat(2,X,zeros(N,1),ones(N,1));

% Get the inhomogenous points a, b.
ab_points = get_projected_points(H_withoutK(:,:,i),Xh);

% Get corrected points with radial distortion
x_corrected = get_corrected(ab_points,ks);

% Get ideal points by multiplying it by intrinsic matrix
x_ideal = get_ideal(x_corrected,K);

% alculate f and error
difference = permute(x(:,:,i),[2 1 3]) - x_ideal;

    f(1, i, :) = difference(1, :);
    f(2, i, :) = difference(2, :);

end
error = sum(f(:).^2);

end
