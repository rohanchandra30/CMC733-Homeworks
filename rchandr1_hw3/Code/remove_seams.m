function I = remove_seams(seam, I, h)
 nseam = length(seam);
 rows = size(I,1);
 cols = size(I,2);
 if h == 1
   for i = 1:cols
       r = sort(seam(:,i)','ascend');
       k = 1;
       for j = r(1)+1:rows
           if sum(find(r == j)) == 0
               I(j-k, i,:) = I(j,i,:);
           else 
                k = k+1;
           end    
       end    
   end 
    I = I(1:end-1,:,:);
    
 else
   for i = 1:rows
       c = sort(seam(:,i)','ascend');
       k = 1;
       for j = c(1)+1:cols
           if sum(find(c == j)) == 0
               I(i, j-k,:) = I(i,j,:);
           else 
                k = k+1;
           end    
       end    
   end 
   I = I(:,1:end-1,:);
 end 
 
end