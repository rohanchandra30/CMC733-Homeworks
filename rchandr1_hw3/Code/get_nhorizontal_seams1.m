function [HS,I] = get_nhorizontal_seams1(Nseams, I)
 rows = size(I,1);
 cols = size(I,2);
 path = zeros(rows, cols);
 cs = cols-1;
 for c=cs:-1:1
  for r=1:rows
      min = 9999;
      if r-1 > 0
          min = I(r-1,c+1);
          path(r,c) = 1;
      end
      if(min > I(r, c+1))
          min = I(r, c+1);
          path(r,c) = 2;
      end
      if r+1 <= rows 
          if(min > I(r+1, c+1))
             min = I(r+1, c+1);
             path(r,c) = 3;
          end    
      end
      I(r,c) = I(r,c) + min;
  end     
 end
 
 [S,Idx] = sort(I(:,1)','ascend');
 
HS = [];
 for i = 1:Nseams
     hs = [];
     r = Idx(i);
     for j = 1:cols
         hs = [hs, r];
         if path(r,j) == 1
             r = r-1;
         else
             if path(r,j) == 3
                 r =r+1;
             end    
         end    
     end    
     HS = [HS;hs];
 end   
end