clear;
P = [3.2 3.2 3 3.2 3.2 3.4 3.2 3 3.2 3.2 3.2 3.9 3.1 3.2;
9.6 10.3 9 10.3 10.1 10 9.6 9 9.6 9.2 9.5 9 9.5 9.7;
3.45 3.75 3.5 3.65 3.5 3.4 3.55 3.5 3.55 3.5 3.4 3.1 3.6 3.45;
2.15 2.2 2.2 2.2 2 2.15 2.14 2.1 2.1 2.1 2.15 2 2.1 2.15;
140 120 140 150 80 130 130 100 130 140 115 80 90 130;
2.8 3.4 3.5 2.8 1.5 3.2 3.5 1.8 3.5 2.5 2.8 2.2 2.7 4.6;
11 10.9 11.4 10.8 11.3 11.5 11.8 11.3 11.8 11 11.9 13 11.1 10.85;
50 70 50 80 50 60 65 40 65 50 50 50 70 70];

t = [2.24 2.33 2.24 2.32 2.2 2.27 2.2 2.26 2.2 2.24 2.24 2.2 2.2 2.35];

[p1,s1] = mapminmax(P);
[t1,s2] = mapminmax(t);

%输入层神经元个数依据插入的数据矩阵的列数确定，数据矩阵是横向插入的
n=10;  %隐藏层神经元个数

%训练
net = newff(p1,t1,n,{'tansig' 'purelin'},'trainlm');  
%输入矩阵，输出矩阵，隐藏层神经元个数，｛输入激活函数，输出激活函数｝
net.trainParam.epochs=50; % 训练次数
net.trainParam.goal=0.01; %拟合精度
net=train(net,p1,t1); %训练
%预测
p2=[3.0;9.3;3.3;2.05;100;2.8;11.2;50];
p3 = mapminmax(p2);
t2 = sim(net,p3); %预测
t3 = mapminmax('reverse',t2,s2);
disp(t3)

%figure;
%plot();
%title('输出结果');
%xlabel('时间');
%ylabel('仿真输出');
%txt = sprintf('已训练，神经元：%s个 ',num2str(n));
% 输入net(x)可自动得出对应y值