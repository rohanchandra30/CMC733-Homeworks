function [K, Hs] = EstimateK_linear(x, X)
% Linear parameter estimation of K
%
%   x:  2D points. n x 2 x N matrix, where n is the number of corners in
%   a checkerboard and N is the number of calibration images
%
%   X:  3D points. n x 2 matrix, where n is the number of corners in a
%   checkerboard and assumes the points are on the Z=0 plane
%
%   imgs: calibration images. N x 1 cell, where N is the number of calibration images
%
%   K: a camera calibration matrix. 3 x 3 matrix.
%
%   Hs: a homography from the world to images. 3 x 3 x N matrix, where N is
%   the number of calibration images. You can use est_homography.m to
%   estimate homographies.
%

%% Your code goes here

% Estimating Homography for the N images
Hs = zeros(3,3,length(x(1,1,:)));
sz = size(x);
for i = 1:sz(3)
    H = est_homography(x(:, 1, i), x(:, 2, i), X(:, 1), X(:, 2));
    Hs(:,:,i) = H;
end

% Estimating V using Homography matrices for N images. Stacking them to be
% a 2Nx6 matrix
for k = 1:sz(3)
    
    V(2*k-1,1:6) = get_vij(1,2,Hs(:,:,k))';
    V(2*k,1:6) = (get_vij(1,1,Hs(:,:,k)) - get_vij(2,2,Hs(:,:,k)))';
    
end

% Performing svd to get last eigenvector of VtV
[U S W] = svd(V);
b = W(:,end);

% Getting all the 'B' contants
B11 = b(1);
B12 = b(2);
B22 = b(3);
B13 = b(4);
B23 = b(5);
B33 = b(6);


% Estimate the intrinsic parameters
vo     = (B12*B13 - B11*B23)/(B11*B22 - B12^2);
lambda = B33 - (B13^2 + vo*(B12*B13 - B11*B23))/B11;
alpha  = sqrt(lambda/B11);
beta   = sqrt((lambda*B11)/(B11*B22 - B12^2));
gama  = -((B12*(alpha)^2*beta)/lambda);
uo     = (gama*vo)/beta - (B13*(alpha)^2)/lambda;

% Formming the intrinsic parameter matrix
K = [alpha,gama,uo;0,beta,vo;0,0,1];




end