Flink does not provide its own data storage system. It takes data from distributed storage.


# some question
flink的时间窗口是怎么样的？


# some tips
* Exactly Once一般是指flink内部Exactly Once，如果flink重启，会有重复消息。
* flink的分布式同步通过barrier
* watermark(水位线)用来处理乱序事件，正确处理乱序事件，一般通过watermark+window实现
