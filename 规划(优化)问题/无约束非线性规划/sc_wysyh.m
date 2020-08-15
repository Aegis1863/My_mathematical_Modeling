function f=sc_wysyh(x) %定义目标函数调用格式
a=64516;hd=pi/180;
f=a/x(1)-x(1)/tan(x(2)*hd)+2*x(1)/sin(x(2)*hd); %定义目标函数