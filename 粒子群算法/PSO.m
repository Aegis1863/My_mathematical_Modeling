% 该方法的核心思想即创建n个粒子的坐标位置，变动坐标并根据条件趋近某一极值
% 本程序中 x 即为全部粒子坐标的数组，适应度实际上就是函数极小值
% 第12行定义未知量个数
%当未知量有2个，可以画出3D目标函数图像，当未知量大于2个时，无法绘制，需要把相关3D作图部分删除
clc;
clear;
close all

%====未知最小值时需要注释掉E====
%E=0.000001;  %已知极小值的时候设定此精度，符合条件时会退出迭代，否则设定无效，粒子会运动到迭代结束
%====未知最小值时需要注释掉E====

maxnum=30; % 最大迭代次数，若未知最小值需要尽量调大以确保精度 【可改动】
narvs=2; % 目标函数的自变量个数  【需要根据实际目标函数的变量个数确定】
particlesize=50; %粒子个数，粒子群规模 【可改动】
c1=2; % 每个粒子的个体学习因子，加速度常数 【可改动】
c2=2; % 每个粒子的社会学习因子，加速度常数 【可改动】
w=0.6; % 惯性因子【可改动，控制粒子运动速度】
vmax=5; % 粒子运动在x，y方向矢量的最大值，用于控制运动速度  【可改动】
v=2*rand(particlesize,narvs); % 粒子初始飞行矢量，有方向和距离，每一组矢量都包括x,y方向的分矢量【无需改动】
x=-2.5+5*rand(particlesize,narvs); % 粒子所在位置
fitness=inline('3*(1-x(1)).^2.*exp(-(x(1).^2)+(x(2)+1).^2)- 10*(x(1)/5 - x(1).^3 - x(2).^5).*exp(-x(1).^2-x(2).^2) - 1/3*exp(-(x(1)+1).^2 - x(2).^2)','x');  
%定义适应度函数【这里是目标函数，本程序中求最小值】

for i=1:particlesize
    personalbest_faval(i)=fitness(x(i,:));  %初始化各粒子适应度
end
personalbest_x=x;  % 初始化粒子所在位置
globalbest_x=personalbest_x(i,:);   % 全局最优坐标暂定为目前适应度（函数值）最小的坐标
k=1; %初始化计数器

while (k<=maxnum)  % 最大迭代次数
    if k ~= 1 %略去第一次循环，原因看第31行
        for i=1:particlesize  % 遍历全部粒子
            f(i)=fitness(x(i,:));  % 计算得到第 i 组坐标粒子的适应度并存到 f( i ) 位置，注意：x实际上就是坐标数组
            if f(i)<personalbest_faval(i)% 判断新的第 i 个坐标适应度是否小于现有第 i 个坐标的组合适应度
                % 注意：第一次迭代时，实际上有 f=personalbest_faval，不进入循环体，因此略去第一次循环，节省内存
                personalbest_faval(i)=f(i); % 用该新适应度替换现有适应度
                personalbest_x(i,:)=x(i,:);   % 新坐标替换现有坐标
            end
        end
        
        %====动态绘图，未知量超过2个时注释掉====
        figure(1)
        plot3(x(:,1),x(:,2),f,'or')
        pause(0.1)
        %====动态绘图，未知量超过2个时注释掉====
        
    end
    % 得到一个被优化后的坐标组合 personalbest_x 和其对应的适应度 personalbest_faval
    [globalbest_faval,i]=min(personalbest_faval);  % min/max求极值时，接受值若为列表则返回  [极值,对应位置]
    globalbest_x=personalbest_x(i,:);   % 全局最优解 暂定为 目前 适应度最小的 个体最优变量组合
    for i=1:particlesize  %遍历全部粒子坐标组合
        v(i,:)=w*v(i,:)+c1*rand*(personalbest_x(i,:)-x(i,:))...  % v是粒子初始飞行矢量，矢量实际上会变化，w是惯性
                         +c2*rand*(globalbest_x-x(i,:));     % c1是个体学习因子（加速度），得到一个 个体学习速度矢量
        % 得到一个被优化的运动矢量组合v                 %  c2是社会学系因子，得到一个 社会学习速度矢量
        for j=1:narvs % 遍历当前粒子的x，y方向矢量
            if v(i,j)>vmax  % 确保x，y方向矢量速度不超过最大值5
                v(i,j)=vmax;
        elseif v(i,j)<-vmax % 作用也是确保分运动矢量最大不超过5，只是换了个方向
            v(i,j)=-vmax;
            end
        end
        x(i,:)=x(i,:)+v(i,:); % 更新粒子位置
    end
    ff(k)=globalbest_faval; % 储存当前最优适应度，ff中实际上储存了全部迭代的最适应值
    
%===未知最小值时需要注释掉下面的语句===
%     if globalbest_faval<E   % 判断当前适应值是否小于设定的精度，若达到精度，退出迭代
%         disp('已经达到精度') % 如果极小值未知，精度设定无效（解释在第六行）则可能会忽视此语句，会进行所有迭代
%         break                        % 不论精度是否有效，都会得出一个局部最优解
%     end             
%===========================

    k=k+1; % 迭代计数器
end

xbest=globalbest_x; % 全局最优解赋值给 xbest
disp('最优点是：')
disp(xbest)
disp('最优是：')
disp(globalbest_faval)

figure(2);
plot(1:length(ff),ff) % 作图查看最适应值随迭代的变化情况
%若是两个位置变量求目标函数，可作3D图

%===未知变量超过3个时注释掉3D作图部分====
% figure(3);
% x1 = -3:0.05:3; % 确定x范围
% y1=x1; 
% [X,Y]=meshgrid(x1,y1); % 矩阵化x，y
% title('3D可视化模型图');
% z1 =3*(1-X).^2.*exp(-(X.^2) - (Y+1).^2) ... 
%    - 10*(X/5 - X.^3 - Y.^5).*exp(-X.^2-Y.^2) ... 
%    - 1/3*exp(-(X+1).^2 - Y.^2) ;   % 目标函数
% mesh(X,Y,z1);  % 作图
%shading interp; % 处理颜色
%===未知变量超过3个时注释掉3D作图部分====