clear
x=0;  y=1; % �����ֵ
szj=[x,y];
a=0;  b=2;  %  ȷ�����
h=0.4;  %����
n=(b-a)/h-1; % n=(b-a)/h;
for i=1:n+1  % i=1:n  ѭ�������������Բ���
    y=y+h*subs(sym(y+2*x/y^2),{'x','y'},{x,y});  % subs �����µ�x,yֵ
    x=x+h;  %����xֵ
    szj=[szj;x,y];  %׷��x,yֵ
end
disp(szj)
plot(szj(:,1),szj(:,2),'or-')  %�������ƽⷽ��
