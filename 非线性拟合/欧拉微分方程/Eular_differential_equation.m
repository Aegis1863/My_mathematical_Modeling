clear
x=0;  y=1; % 定义初值
szj=[x,y];
a=0;  b=2;  %  确定间距
h=0.4;  %步长
n=(b-a)/h-1; % n=(b-a)/h;
for i=1:n+1  % i=1:n  循环次数，间距除以步长
    y=y+h*subs(sym(y+2*x/y^2),{'x','y'},{x,y});  % subs 迭代新的x,y值
    x=x+h;  %更新x值
    szj=[szj;x,y];  %追加x,y值
end
disp(szj)
plot(szj(:,1),szj(:,2),'or-')  %画出近似解方程
