function v = get_vij(i,j,h)


v = [h(1,i)*h(1,j), h(1,i)*h(2,j) + h(2,i)*h(1,j), h(2,i)*h(2,j),h(3,i)*h(1,j) + h(1,i)*h(3,j), h(3,i)*h(2,j) + h(2,i)*h(3,j), h(3,i)*h(3,j)];

v = v';


end