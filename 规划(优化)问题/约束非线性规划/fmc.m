clear;
% [x,fval,exitflag,output, grad,hessian]=
%                       fmincon(@fun,x0,A,b,Aeq,beq,Lb,Ub,'Nlc',options,P1,P2…);
% fun为目标函数，x0为初值，A,B,Aeq,Beq为线性约束对应的矩阵和向量，
% LB，UB分别为x的下限和上限
% NONLCON为非线性约束（需要写自定义函数），OPTIONS为优化参数
options = optimset;
[x,fval] = fmincon('MuBiao_Func', rand(2,1), [], [], [], [], zeros(2,1),[],'YueShu_Func', options);
disp('x = ')
disp(x)
disp('fval = ')
disp(fval)
%‘fun1’代表目标函数，rand(2,1)随机给了x初值，
%   zeros(2,1)代表下限为0，即x1，x2>=0, 'fun2'即刚才写的约束条件。