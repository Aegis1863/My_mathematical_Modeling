x = [1949 1954 1959 1964 1969 1974 1979 1984 1989 1994 ];
x1 = 1949:0.1:1994;
y = [5.4  6.0  6.7  7.0  8.1  9.1  9.8  10.3 11.3  11.8 ];
a = polyfit(x,y,1);
y1 = polyval(a,x1);  % 拟合1 ：常规一元拟合

b = polyfit(x1,log(y1),1);   % 拟合2：y=ae^(bx) 两边加'ln'转化为线性，注意变换

y2 = exp(b(2)).*exp(b(1)*x1);

x2 = 1999;
y3 = polyval(a,x2);
y4 = exp(b(2)).*exp(b(1)*x2);
plot(x,y,'x',x1,y1,'k',x1,y2,'r--',x2,y3,'ob',x2,y4,'or');
text(x2+1,y3,['[1999,',num2str(y3),']']);
text(x2+1,y4,['[1999,',num2str(y4),']']);