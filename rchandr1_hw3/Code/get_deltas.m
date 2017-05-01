function dels = get_deltas(I2, masks)

for i = 1:8
   dels{i} = conv2(I2, masks{i}, 'same'); 
end





end