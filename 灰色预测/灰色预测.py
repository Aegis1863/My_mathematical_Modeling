# -*- coding: utf-8 -*-
"""
Created on Thu Aug  6 22:31:32 2020

@author: LiSunBowen
"""

import numpy as np
from numpy.linalg import *
import math
import matplotlib.pyplot as plt
y = eval(input('请输入数据：'))
n = len(y)
yy = np.ones((n,1))
yy[0] = y[0]
for i in range(1,n):
    yy[i] = yy[i-1] + y[i]
B = np.ones((n-1,2))
for i in range(0,n-1):
    B[i][0] = - (yy[i] + yy[i+1])/2
    B[i][1] = 1
BT = B.T
yn = np.ones((n-1,1))
for j in range(0,n-1):
    yn[j] = y[j+1]
A = np.dot(np.dot(inv(np.dot(BT,B)),BT),yn)
a = A[0]
u = A[1]
t = u/a
i = np.array([i for i in range(n+3)])
yys = []
for j in range(len(i)):
    yys = (y[0]-t)*np.array([math.exp(-a*j) for j in i])+t
    yys[0] = 1
yys[0] = y[0]
ys=[i for i in range(n+2)]
for j in range(n+1,0,-1):
    ys[j] = yys[j] - yys[j-1]
x = [i for i in range(1,n+1)]
xs = [i for i in range(2,n+3)]
yn = ys[1:n+3]
det = 0
sum1=0
sumpe=0
for i in range(n):
    sumpe=sumpe+y[i]
pe = sumpe/n
for i in range(n):
    sum1=sum1+(y[i]-pe)**2
s1=math.sqrt(sum1/n)
sumce=0
for i in range(1,n):
    sumce=sumce+(y[i]-yn[i])
ce=sumce/(n-1)
sum2=0;
for i in range(1,n):
    sum2=sum2+(y[i]-yn[i]-ce)**2;
s2=math.sqrt(sum2/(n-1))
c=s2/s1
print('后验差比值为：',c)
if c < 0.35:
    print('系统预测精度好')
elif c < 0.5:
    print('系统预测精度合格')
elif c < 0.65:
    print('系统预测精度勉强')
else:
    print('系统预测精度不合格')
print('下个拟合值为 ',ys[n])
print('再下个拟合值为',ys[n+1])
plt.plot(x,y,linestyle='',color = 'red',marker='D')
plt.plot(xs,yn,linestyle='--',color = 'green')
plt.show()
