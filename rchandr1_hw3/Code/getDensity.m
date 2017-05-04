function E = getDensity(Im, idx)
  Img = rgb2gray(Im);
 [Gx, Gy] = imgradientxy(Img);
 [Gmag, GDiff] = imgradient(Gx, Gy);
 if idx == 1
     E = Gmag;
 else 
     E= GDiff;
 end    
end