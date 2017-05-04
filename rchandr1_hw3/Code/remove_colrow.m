function I = remove_colrow(seam, I, h)
 nseam = length(seam);
 rows = size(I,1);
 cols = size(I,2);
 if h == 1
       r = sort(seam(:,1)','ascend');
       k = 1;
       for j = 1:cols
               if c(1) < rows
                I(r(1), j) = I(r(1)+1,j); 
               end
       end    
      I = I(1:end-1,:);
    
 else
       c = sort(seam(:,1)','ascend');
       k = 1;
       for j = 1:rows
               if c(1) < cols
                 I(j, c(1)) = I(j,c(1)+1);
               end  
               %k = k+1;
       end    
       I = I(:,1:end-1);
 end 
 
end