%% Question 1

clc
clear all
close all

% Read in image
I2 = im2double(rgb2gray(imread('../Images/Brain.jpg')));
I = I2;

% Setting Parameters
K = 20;
prompt = 'Which variant do you want to run? ';
variant = input(prompt)
lambda = 0.01;
iter = 20;


% Algorithm
for t = 1:iter
    t
    
    %     Compute Delta's
    masks = get_masks();
    dels = get_deltas(I2, masks);
    
    
    %     Choose and compute variant
    if variant == 1
        c = get_c_1(dels, K);
        
    elseif variant == 2
        c = get_c_2(dels, K);
        
    end
    %     Use equation
    sum = 0;
    for i = 1:8
        sum = sum + c{i}.*dels{i};
    end
    I = I + lambda*sum;
    
end

% Plotting
subplot(1,2,1)
imshow(I2)
subplot(1,2,2)
imshow(I)
