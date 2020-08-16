# -*- coding: utf-8 -*-
"""
Created on Tue Aug 11 12:25:24 2020

@author: LiSunBowen
"""

import numpy as np
import matplotlib.pyplot as plt
from math import exp
from numpy.linalg import *
from mpl_toolkits.mplot3d import Axes3D
from scipy.interpolate import griddata
x=[129.0,140.0,103.5,88.0,185.5,195.0,105.5,57.5,107.5,77.0,81.0,162.0,162.0,117.5]
y=[7.5,141.5,23.0,147.0,22.51,37.5,85.5,-6.5,-81,3.0,56.5,-66.5,84.0,-33.5]
z=np.array([4,8,6,8,6,8,8,9,9,8,8,9,4,9])
x1 = np.linspace(75,200)
y1 = np.linspace(-50,150)
X,Y=np.meshgrid(x1,y1)
point = []
for i in range(len(x)):
    newp = [x[i],y[i]]
    point.append(newp)
point = np.array(point)
znew = griddata(point,z,(X,Y),method='cubic') # 插值
fig=plt.figure() #画图
ax=Axes3D(fig)
ax.plot_surface(X,Y,znew)
plt.show()
