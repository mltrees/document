dir(): 返回参数的属性、方法列表
python2中的print与python3一致:  from __future__ import print_function
入参解析: from optparse import OptionParser


python输入object是什么格式?


第三方模块
shutil: 高级文件操作模块（新建/删除/查看文件属性，以及移动 复制  打包 压缩 解压）
logging: Python内置的标准模块，主要用于输出运行日志，可以设置输出日志的等级、日志保存路径、日志文件回滚等；
kazoo: zookeeper client模块

numpy.ndarray返回大小： x.size, 返回3个维度的大小 x.shape

# numpy
ndarray在后续增加: numpy.append(a, [1,2,3])
生成随机权重的矩阵: p.random.rand(rows, columns)
a矩阵的转置： numpy.array(a).T

# matploylib

## tips
### matplotlib
python使用交互terminal绘图时，只显示
<matplotlib.collections.PathCollection object at 0x11b64b320>
此时，可再调用 plt.show() 即可显示所绘制图形

imshow()实现热图的绘制

