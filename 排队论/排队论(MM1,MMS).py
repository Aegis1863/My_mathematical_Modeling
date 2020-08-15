# -*- coding: utf-8 -*-
"""
Created on Thu Aug 13 17:51:35 2020

@author: LiSunBowen
"""

import matplotlib.pyplot as plt
import numpy as np

def factorial(number):
    '''
    阶乘函数

    Parameters
    ----------
    number : int
        输入值必须为整数.

    Returns
    -------
    int
        返回参数阶乘数.

    '''
    if number <= 1:
        return 1
    else:
        return number*factorial(number-1)

model = input('请输入模型(MM1,MMS)：') or 'MM1'
if model == 'MM1':
    while True:
        unittime = input('输入时间单位(默认h)：') or 'h'
        λ = input('>>输入单位时间平均到客人数[λ(个/{})]值：'.format(unittime))
        μ = input('>>输入单位时间平均服务人数[μ(个/{})]值：'.format(unittime))
        print('==================================')
        if λ!='' and μ!='':
            λ = float(λ)
            μ = float(μ)
            break
        else:
            print('Erroe:请输入正确的值\n******************')
    t1 = np.linspace(0,1,30)
    ρ = λ/μ
    l1 = λ/(μ-λ)
    l2 = λ**2/(μ*(μ-λ))
    w1 = 1/(μ-λ)
    w2 = ρ*w1
    print('注意：μ={},λ={},平均逗留时间=平均处理时间+平均排队时间,队长 = 平均排队长+平均正在服务长'.format(μ,λ))
    print('平均队长{:.3f}(个/{})\n平均排队长为{:.3f}(个/{})\n每个平均逗留{:.3f}({}/个)\n每个平均处理{:.3f}({})\n柜员平均忙碌时间{:.3f}({})\n柜员空闲概率{:.3f}'
          .format(l1,unittime,l2,unittime,w1,unittime,w2,unittime,w1,unittime,1-ρ))
    wait1 = np.power(np.exp(1),(t1.dot(-(μ-λ))))
    #开始作图
    ax = plt.figure()
    plt.rcParams['font.sans-serif'] = ['Microsoft YaHei']
    plt.xlabel('等待时间({})'.format(unittime),fontsize=10)
    plt.ylabel('概率',fontsize=15)
    plt.title('每名顾客等待 时间-概率 分布')
    l1, = plt.plot(t1,wait1,label = 'P{T>t}=e^(-(μ-λ)*t)')
    plt.legend(fontsize = 15)
    plt.grid(linestyle=':')
    plt.show()
    
    
    '''
    注意，MMS模型实际上就是S个MM1模型，除了λ相应缩小S倍以外，其他的参数没有区别
    '''
    
    
elif model == 'MMS':
    while True:
        unittime = input('输入时间单位(默认min)：') or 'min'
        λ = input('>>输入单位时间平均到客人数[λ(个/{})]值：'.format(unittime))
        μ = input('>>输入单位时间服务顾客数[μ(个/{})]值：'.format(unittime))
        s = input('>>输入服务台数量[m<90(个)]：')
        print('==================================')
        if λ!='' and s !='' and μ != '':
            m = int(s)
            λ = float(λ)
            μ = float(μ)
            break
        else:
            print('Erroe:请输入正确的值\n******************')
    p0 = 0
    p = 0
    ρ = λ/μ
    for n in range(0,m+1):
        if n != m:
            p = ρ**n/factorial(n)
            p0 = p + p0
        elif n == m:
            p = ρ**n/(factorial(n)*(1-ρ/n))
            p0 = (p0 +p)**(-1) #最终的p0就是全部空闲概率
    ρs = λ/(m*μ)
    lq = (p0*ρ**(m+1)/m)/(factorial(n)*(1-ρ/n)**(m-1)) #平均排队长
    avs = ρ #忙碌服务台的平均数
    l = lq + ρ #平均队长
    W = l/λ #平均逗留时间
    Wq = lq/λ #平均等待时间
    def fc(m,ρ,p0):
        return ρ**m/(factorial(m)*(1-ρ/m))*p0
    c = fc(m,ρ,p0) #顾客必须等待的概率
    print('服务台全部空闲概率:{:.3f}'.format(p0))
    print('顾客必须等待概率:{:.3f}'.format(c))
    print('平均队长:{:.3f}(个/{})'.format(l,unittime))
    print('平均排队长:{:.3f}(个/{})'.format(lq,unittime))
    print('平均逗留时间{:.3f}({})'.format(W,unittime))
    print('平均等待时间(处理时间){:.3f}({})'.format(Wq,unittime))
