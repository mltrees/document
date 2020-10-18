# RNN

RNN方程
$$
a^{(t)} = b + Wh^{(t-1)} + Ux^{(t)} \\
h^{(t)} = tanh(a^{(t)}) \\
o^{(t)} = c + Vh^{(t)} \\
\hat{y}^{(t)} = softmax(o^{(t)})
$$
