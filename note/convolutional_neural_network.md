# 卷积网络



卷积网络(convolutional network) (convolutional neural network) CNN是指那些至少在网络的一层中使用卷积运算来替代一般的矩阵乘法运算的神经网络。

卷积是一种特殊的线性运算

对最近的结果赋予更高的权重，再采用加权$w(a)$来实现平滑
$$
s(t) = \int x(a)w(t-a)da
$$
这种运算称为卷积(convolution)，卷积运算通常用星号表示
$$
s(t)=(x*w)(t)
$$
$w$有效概率密度函数

卷积定义在满足上述积分的任意函数，也可用于加权平均以外的目的

离散卷积
$$
s(t)=(x*w)(t)=\sum^{\infty}_{\alpha=-\infty}x(a)w(t-a)
$$
卷积三个特点

稀疏交互

参数共享

等变表示