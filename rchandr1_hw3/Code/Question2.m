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
%         image{index} = beter_gaussian(image{index});
%         image{index} = imfilter(double(image{index}), 'gaussian', 0, 0.01);
        image{index} = imgaussfilt(image{index});
        train_vectors(:,index) = image{index}(:);
        index = index + 1;
    end
    
end
M = index - 1;
% Computing mean face
chi = sum(train_vectors, 2)./M;
std_train = std(train_vectors);

% STEP 2:
% Computing phi
phi = bsxfun(@minus, train_vectors, chi);
% phi = phi./std_train;
A = phi;


% Computing L matrix
L = A'*A;

% Compute M' = 40 largest eigenvectors of L matrix
[V, D] = eig(L);
V = V(:, end - 39:end);

% STEP 3:
% Combine according to equation 6
U =  phi*V;
for i = 1:40
   U(:,i) = U(:,i)/norm(U(:,i)); 
end

% STEP 4:
% Compute weigth vectors for all input faces
W = U'*phi;

for i = 1:40
    Omega_train(:, i) = (W(:, 4*i-3) + W(:, 4*i-2) + W(:, 4*i-1) + W(:, 4*i))/4;
    
end


% STEP 5:
% Compute the new Omega vector by computing weights for new face as w =
% U'*(gamma - chi)

% Read in test data
index = 1;
for i = 1:40
    path1 = sprintf('../Images/Dataset/Test/s%d', i);
    
    for j = 5:10
        path2 = sprintf('%d.pgm', j);
        filename = fullfile(path1, path2);
        image_test{index} = im2double(imread(filename));
        test_vectors(:,index) = image_test{index}(:);
        index = index + 1;
    end
    
end

% Normalize
M = index - 1;
chi = sum(test_vectors, 2)./M;
std_test = std(test_vectors);
phi_test = bsxfun(@minus, test_vectors, chi);
% phi_test = phi_test./std_test;
W_test = U'*phi_test;
% Compute average faces for test data
for i = 1:40
    Omega_test(:, i) = (W_test(:, 6*i-5) + W_test(:, 6*i-4) + ...
        W_test(:, 6*i-3) + W_test(:, 6*i - 2) +...
        W_test(:, 6*i - 1) + W_test(:, 6*i))/4;
    
end

% Compute Class
for i = 1:40
    for j = 1:40
%    Compute Distance
   eps(j) =  norm(Omega_train(:,j) - Omega_test(:,i)).^2;
    end
    % Find minimum
class(i) = find(eps == min(eps));
end

Accuracy = (length(find(class - [1:40] == 0)))/.4
