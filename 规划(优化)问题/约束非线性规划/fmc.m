clear;
% [x,fval,exitflag,output, grad,hessian]=
%                       fmincon(@fun,x0,A,b,Aeq,beq,Lb,Ub,'Nlc',options,P1,P2��);
% funΪĿ�꺯����x0Ϊ��ֵ��A,B,Aeq,BeqΪ����Լ����Ӧ�ľ����������
% LB��UB�ֱ�Ϊx�����޺�����
% NONLCONΪ������Լ������Ҫд�Զ��庯������OPTIONSΪ�Ż�����
options = optimset;
[x,fval] = fmincon('MuBiao_Func', rand(2,1), [], [], [], [], zeros(2,1),[],'YueShu_Func', options);
disp('x = ')
disp(x)
disp('fval = ')
disp(fval)
%��fun1������Ŀ�꺯����rand(2,1)�������x��ֵ��
%   zeros(2,1)��������Ϊ0����x1��x2>=0, 'fun2'���ղ�д��Լ��������