x0=[25,45]; %初始点
[x,Fmin]=fminunc(@sc_wysyh,x0); %求优语句，调用方程，初始迭代点
fprintf(1,'截面高度h x(1)=%3.4fmm\n',x(1))
fprintf(1,'斜边夹角θ x(2)=%3.4f度\n',x(2))
fprintf(1,'截面周长s f=%3.4fmm\n',Fmin)
