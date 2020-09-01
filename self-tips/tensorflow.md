#中文简介:
* https://blog.csdn.net/u013510838/article/details/84103503
# tensorflow-serving call graph
* DirectSession

# little tips
* graph_execution_state.cc:593:  每维特征的名称->Tensorid->feeds.emplace
* tensorflow threadpool.h, NonBlockingThreadPool.h
* 每一个partial executor会维护一个RunState, 所有executor done后，会发executor_done消息
* Rendezvous 将tensor从生产者传递至消费者
* node包括name op及attr，可以是值或者op，是op时，用input来确定是哪两个node作为输入
* direct_session.cc:DirectSession::CreateExecutors, 新建executor，新建时会新建graph
* ClientGraph是full graph的一个子模型
* graph_execution_state.cc: OptimizeGraph可能比较耗时
* placement value(/job:localhost/replica:0/task:0/device:CPU:0)
* Executor中有graph信息
* op_kernel.cc: CreateOpKernel
* 每个op都对应一个kernel,创建或者复用
* knnpred_handle_ 线程是否可以调低或者删除？
* kernel_is_async kernel可以配置成是异步的, 关注complete及NodeDone函数的使用，ExecutorState::Process
* kernel op的async化？
* tf2.0设计上没有tf.Session，因此tf1.5使用时会报错，可以修改为import tensorflow.compat.v1 as tf



## 从源码构建
* bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
* ./bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
* pip install pip install /tmp/tensorflow_pkg/tensorflow-1.15.0-cp37-cp37m-macosx_10_7_x86_64.whl




## metaGraph
* MetaInfoDef
* GraphDef node的集合
* SaveDef 图的save信息，需保存的tensor的名字
* CollectionDef 
* Collection

# test client request (tfs)
* python predict_client.py --databin=rec_test_proto/app_hp_id18_tfs_model_exp_1.proto --server=localhost:8000 --model_name=app_hp_id18_tfs_model_exp --model_signature_name=serving_default




#question
1. ExecutorsAndKeys 是啥意思?
1. TensorShapeProto
1. Placeholder是一个op?
1. "_Recv" op是啥意思？
1. TensorAndDevice?
1. node->def().op()
1. tensorflow::ExecutorBarrier ?
1. signatureDef
1. dotrace是干嘛用的？
1. tf_Compute 及 tf_Eigen 的作用分别是什么？
2. tensorflow_mode 及 tf_BasicManager的作用？

model_proner.cc:
rewriter



# to confirm
create graph时，感觉有分布式的考虑
executor 第一次create，第二次直接使用？

executor: step_id, call_frame, redezvous

tensorflow 如何编译进eigen

# 报错及解决

* ImportError: Could not import tensorflow. Do not import tensorflow from its source directory; change directory to outside the TensorFlow source tree, and relaunch your Python interpreter from there

解决： 不在tensorflow的源码目录下加载代码

# MNIST数据集
MNIST 数据集可在 http://yann.lecun.com/exdb/mnist/ 获取, 它包含了四个部分:

    Training set images: train-images-idx3-ubyte.gz (9.9 MB, 解压后 47 MB, 包含 60,000 个样本)
    Training set labels: train-labels-idx1-ubyte.gz (29 KB, 解压后 60 KB, 包含 60,000 个标签)
    Test set images: t10k-images-idx3-ubyte.gz (1.6 MB, 解压后 7.8 MB, 包含 10,000 个样本)
    Test set labels: t10k-labels-idx1-ubyte.gz (5KB, 解压后 10 KB, 包含 10,000 个标签)


# work reference
原生tensorflow对saved_model.pb大小有限制





