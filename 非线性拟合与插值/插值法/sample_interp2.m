x=1:5;
y=1:3;
temps=[82 81 80 82 84;79 63 61 65 81;84 84 82 85 86];
figure(1);
mesh(x,y,temps)

xi=1:0.2:5;
yi=1:0.2:5;
[xi,yi] = meshgrid(xi,yi);
zi=interp2(x,y,temps,xi,yi,'cubic'); % ���ڽ���ֵ nearest �� ˫���Բ�ֵ linear �� ˫���β�ֵ cubic
figure(2)
mesh(xi,yi,zi)
