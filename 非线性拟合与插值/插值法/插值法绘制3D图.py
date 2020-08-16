# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""


from scipy.interpolate import griddata
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
points = np.array([[129,7.5],[140,141.5],[103.5,23],[88,147],[185.5,25.5],[195,137.5],[105,85.5],[157,-6.5],[107.5,81],[77,3],[81,56.5],[162,-66.5],[162,84],[117.5,-33.5]])
values = np.array([4,8,6,8,6,8,8,9,9,8,8,9,4,9]) #已知散点的值
xo = np.linspace(75,200,100)
yo = np.linspace(-50,150,100)
XO,YO = np.meshgrid(xo,yo)
ZO =griddata(points,values,(XO,YO),method='cubic')
xi, yi = np.mgrid[75:200:100j, -50:150:100j] # meshgride参数为数组，mgrid参数类似range()可以处理多维数据
znew = griddata(points,values,(xi,yi),method='cubic') #进行插值 
fig=plt.figure()#画图
ax = Axes3D(fig)
ax.plot_surface(xi,yi,znew,rstride=2,cstride=2,edgecolor='grey') # 插值法作图似乎无法上色
plt.show()
