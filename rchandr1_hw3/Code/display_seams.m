function display_seam(seam,E1,OrgIm, h)
rowsn = 1:size(OrgIm,1);
colsn = 1:size(OrgIm,2);


figure, imshow(OrgIm), hold on;
% for i = 1:szh
if h == 1
 plot(colsn', seam', '.y');  
else 
 plot( seam',rowsn', '.r');  
end
hold off;

end