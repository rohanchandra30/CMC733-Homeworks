function [VS,I] = get_nvertical_seams1(Nseams, I)

 rows = size(I,1);
 cols = size(I,2);
 path = zeros(rows, cols);
 rw = rows -1;
 for r=rw:-1:1
  for c=1:cols
      min = 9999;
      if c-1 > 1 
          min = I(r+1,c-1);
          path(r,c) = 1;
      end
      if(min > I(r+1, c))
          min = I(r+1, c);
          path(r,c) = 2;
      end
      if c+1 <= cols 
          if(min > I(r+1, c+1))
             min = I(r+1, c+1);
             path(r,c) = 3;
          end    
      end
      I(r,c) = I(r,c) + min;
  end     
 end
 
 [S,Idx] = sort(I(1,:),'ascend');
 
VS = [];
 for i = 1:Nseams
     vs = [];
     c = Idx(i);
     for j = 1:rows
         vs = [vs, c];
         if path(j,c) == 1
             c = c-1;
         else
             if path(j,c) == 3
                 c =c+1;
             end    
         end    
     end    
     VS = [VS;vs];
 end 
end