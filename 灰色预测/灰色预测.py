# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 22:31:32 2020

@author: LiSunBowen
"""

import numpy as np
from numpy.linalg import *
import math
import matplotlib.pyplot as plt
y = np.array(eval(input('请输入数据：')))  # 原始数列 y
pv = eval(input('预测值个数：') or '2')+1
n = len(y)
yy = np.ones((n,1))
yy[0] = y[0]
for i in range(1,n):
    yy[i] = yy[i-1] + y[i]  # 对原数列y进行累加
B = np.ones((n-1,2))
for i in range(0,n-1):
    B[i][0] = - (yy[i] + yy[i+1])/2  # 对yy做紧邻均值生成
    B[i][1] = 1
    # B为数据矩阵
BT = B.T
yn = np.ones((n-1,1))
for j in range(0,n-1):
    yn[j] = y[j+1]
A = np.dot(np.dot(inv(np.dot(BT,B)),BT),yn) # 最小二乘法
a = A[0]  # 发展系数
u = A[1]  # 灰作用量
t = u/a
i = np.array([i for i in range(n+pv)]) #pv=3
yys = []
for j in range(len(i)):
    yys = (y[0]-t)*np.array([math.exp(-a*j) for j in i])+t  # 预测后续数据，也称响应序列
    yys[0] = 1
yys[0] = y[0] # 后续数据
ys=[i for i in range(n+pv-1)] # 准备好还原数据的列表
for j in range(n+pv-2,0,-1):
    ys[j] = yys[j] - yys[j-1]  # 对yys做累减还原，生成预测值
ys[0] = y[0]

# 预测完毕，开始检验
x = [i for i in range(1,n+1)]
xs = [i for i in range(2,n+pv)]
yn = ys[1:n+pv] # 截取2至末项
det = 0
sum1 = 0
sumpe = 0
for i in range(n):
    sumpe = sumpe+y[i]
pe = sumpe/n  # 原序列均值
for i in range(n):
    sum1= sum1+(y[i]-pe)**2  # 原序列方差
s1 = math.sqrt(sum1/n) # 原序列标准差
sumce = 0
h = ys[:len(y)]
eps = h - y
# 相对残差Q检验
delta = abs(eps/y)
Q = delta.mean()
# 方差比C检验
C = eps.std()/y.std()
# 小误差概率P检验
S1 = y.std()
temp = np.sum((abs(eps-eps.mean()) < 0.6745 * S1) == True)
P = temp/n
# 后验差比值检验
for i in range(1,n):
    sumce = sumce+(y[i]-yn[i])
ce = sumce/(n-1)
sum2 = 0;
for i in range(1,n):
    sum2 = sum2+(y[i]-yn[i]-ce)**2;
s2 = math.sqrt(sum2/(n-1))
c = s2/s1
print('\n>> 残差 Q = {:.5f}'.format(Q))
print('>> 方差比 C = {:.5f}'.format(C))
print('>> P检验：{:.3f}'.format(P))
print('>> 后验差比值 = {:.5f}'.format(c))
if c < 0.35:
    print('\n===系统预测精度好!===')
elif c < 0.5:
    print('===系统预测精度合格!===')
elif c < 0.65:
    print('===系统预测精度勉强!===')
else:
    print('===系统预测精度不合格!===')
print('\n下个拟合值为 %.3f'%ys[n])
print('再下个拟合值为 %.3f'%ys[n+1])
print('全部拟合值为：\n',ys[n:])
plt.plot(x,y,linestyle='',color = 'red',marker='D')
plt.plot(xs,yn,linestyle='--',color = 'green')
plt.rcParams['font.sans-serif'] = ['Microsoft YaHei']
plt.title('灰色预测曲线')
plt.grid()
plt.show()
