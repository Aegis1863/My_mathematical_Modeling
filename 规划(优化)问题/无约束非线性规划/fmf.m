x0=[25,45]; %��ʼ��
[x,Fmin]=fminunc(@sc_wysyh,x0); %������䣬���÷��̣���ʼ������
fprintf(1,'����߶�h x(1)=%3.4fmm\n',x(1))
fprintf(1,'б�߼нǦ� x(2)=%3.4f��\n',x(2))
fprintf(1,'�����ܳ�s f=%3.4fmm\n',Fmin)
