# word2vec

设词表的总大小为N，embedding的维度为EM，

输入是one-hot，维度为$1 \times N$,输入处理矩阵WI，维度为$N\times EM$,输出处理矩阵WO ，维度为$EM \times N$，则可以通过梯度下降和误差反向传播训练出WI，从而得到每个数组的embedding。