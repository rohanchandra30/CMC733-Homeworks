function c = get_c_1(dels, K)
for i = 1:8
   c(i) = exp(-(dels{i}/K).^2); 
    
end

end