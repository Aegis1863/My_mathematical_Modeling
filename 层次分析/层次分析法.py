import numpy as np
example = [[1,1/2,4,3,3],[2,1,7,5, 5],[1/4,1/7,1,1/2,1/3],[1/3,1/5, 2,1,1],[1/3,1/5,3,1,1]]
print('输入的判断矩阵模板：',example,'\n')
A= np.array(eval(input('>>>请输入判断矩阵：')))  # 不输入任何值会报错
print()
[n,n] = A.shape
x = np.ones((n,100))
y = np.ones((n,100))
m = np.zeros((1,100))
m[0][0] = max(x[:,0])
y[:,0] = x[:,0]
x[:,1] = np.dot(A,y[:,0])
m[0][1] = max(x[:,1])
y[:,1] = x[:,2]/m[0][1]
p = 0.0001
i = 1
k = abs(m[0][1]-m[0][0])
while k>p:
    i = i+1
    x[:,i] = np.dot(A,y[:,i-1])
    m[0][i] = max(x[:,i])
    y[:,i] = x[:,i]/m[0][i]
    k = abs(m[0][i]-m[0][i-1])
a = sum(y[:,i])
w = y[:,i]/a # w是权重
t = m[0][i]
CI = (t-n)/(n-1)
RI=[0, 0, 0.52, 0.89, 1.12, 1.26, 1.36, 1.41, 1.46, 1.49, 1.52, 1.54, 1.56, 1.58, 1.59]
CR = CI/RI[n-1]
if CR< 0.1:
    print('此矩阵的一致性可以接受！\n')
    print('>>权重为：', w, end = '\n')
    print('CI = ', CI)
    print('CR = ', CR)
else:
    print('警告，此矩阵的一致性不可接受！')
    print('CI = ', CI)
    print('CR = ', CR)
