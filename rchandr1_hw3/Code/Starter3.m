clear all;
clc;
close all;
OrgIm = imread('../Images/SeamCarving.jpg');
figure, imshow(OrgIm), title('Gradient magnitude');
saveas(gcf,'org_image.png');
Nrows = 100;
Ncolums = 200;
Nrowi = 1;
Ncoli = 2;
%===**=== Computing the Image energy function ===**===%
Im = OrgIm;

E1 = getDensity(Im,2);
figure, imshow(E1,[]), title('Gradient magnitude');
saveas(gcf,'energy_image2.png');
kh = 1;
kv = 1;

cr = 1;
cc = 1;
rowsn = 1:size(OrgIm,1);
colsn = 1:size(OrgIm,2);

figure, imshow(OrgIm), hold on;
for counter=1:min(Nrows,Ncolums)
    %% == horizontal seaming == %%
    [hr{kh},E1] = get_nhorizontal_seams1(1, E1); 
    Im = remove_seams(hr{kh}, Im, 1);
    rowsn = rowsn(1:end-1);
    E1 = getDensity(Im,1);
    plot( colsn',hr{kh}', '.y'); 
    
    %% == vertical seaming == %%
    [vr{kv},E1] = get_nvertical_seams1(1, E1);
     Im = remove_seams(vr{kv}, Im, 0);
     colsn = colsn(1:end-1);
     E1 = getDensity(Im,1);    
     plot(vr{kv}',rowsn', '.r'); 
     
      kv = kv + 1; 
     [vr{kv},E1] = get_nvertical_seams1(1, E1);
     Im = remove_seams(vr{kv}, Im, 0);
     colsn = colsn(1:end-1);
     E1 = getDensity(Im,2);     
     plot(vr{kv}',rowsn', '.r'); 
     
     kh = kh + 1;
     kv = kv + 1;
end
hold off;
saveas(gcf,'all_seams.png');

figure, subplot(1,2,1), imagesc(Im), title('Image after resizing with seam carving');
subplot(1,2,2), imagesc(OrgIm), title('Original Image');
saveas(gcf,'final_image.png');

