% Implementing Algorithm given on page 76 of Eigenface paper. 

clc
clear all
close all
index = 1;

% Read in Training Images
for i = 1:40
    path1 = sprintf('../Images/Dataset/Train/s%d', i);
  
    for j = 1:4
        path2 = sprintf('%d.pgm', j);
        filename = fullfile(path1, path2);
        image{index} = im2double(imread(filename));
        im_vectors(:,index) = image{index}(:);
        index = index + 1;
    end
    
end
M = index - 1;
% Computing mean face
chi = sum(im_vectors, 2)./M;

% STEP 2: Computing phi
phi = bsxfun(@minus, im_vectors, chi);
A = phi;

% STEP 2: Computing L matrix
L = A'*A;

% STEP 2: Compute M' = 40 largest eigenvectors of L matrix
[V, D] = eig(L);
V = V(:, end - 39:end);

% STEP 3: Combine according to equation 6
U =  phi*V;

% STEP 4: 
