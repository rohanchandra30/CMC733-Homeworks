% close all
I = im2double(imread('avw.jpg'));
imshow(I);hold on
Z = 174;
c = 971;


% find v
% a = [482 387; 490 1567];  %Starting points in first row, ending points in second row
% b = [2775 440;2720 1604];

a = [319 499; 338 1735];  %Starting points in first row, ending points in second row
b = [2699 536;2668 1752];

plot(a(:,1),a(:,2),'magenta');plot(b(:,1),b(:,2),'magenta')

[m1,c1] = get_equation(a);
[m2,c2] = get_equation(b);
[v_col,v_row] =get_intersection(m1, m2, c1, c2)


x = 1954;
x_dash = 889;

plot(1:size(I,2),c,'g.')
% saveas(gcf,'../Report/horizon.jpg');
plot(v_col,1:size(I,1),'b.')
% saveas(gcf,'../Report/Vanishingpoint.jpg');
plot(1:size(I,2),x,'r.')
plot(1:size(I,2),x_dash,'r.')
% saveas(gcf,'../Report/planes1.jpg');




N = (x_dash - c)*(x - v_row);
D = (x - c)*(x_dash - v_row);
Z_c = Z/(1 - (N/D))

% calculating height of door
x = 1889;
x_dash = 502;


plot(1:size(I,2),c,'g.')
plot(1:size(I,2),x,'y.')
plot(v_col,1:size(I,1),'b.')
plot(1:size(I,2),x_dash,'y.')
% saveas(gcf,'../Report/planes2.jpg');

N = (x_dash - c)*(x - v_row);
D = (x - c)*(x_dash - v_row);

height = Z_c*(1 - (N/D))

% saveas(gcf,'../Report/finalimage.jpg');
% title('Height: %d',height)
