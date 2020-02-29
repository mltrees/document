## start zookeeper

## start standalone storm
storm nimbus&
storm supervisor&
storm ui&
查看storm界面:
http://localhost:8080

本地运行storm程序: storm local target/storm-HelloWorld-2.1.0.jar com.storm.test.helloworld.WordCountTopology (其中，com.storm.test.helloworld是package名称，.WordCountTopology是有main的类名)
集群运行storm程序: storm jar

## storm tutorial
https://storm.apache.org/releases/current/Tutorial.html
https://www.tutorialspoint.com/apache_storm/apache_storm_installation.htm

### spout
输入数据的初始处理，将输入数据变为stream，供bolt使用
### bolt
流数据的计算，可能会产生新的数据
### link
显示spout和bolt的数据依赖关系

### topology
一系列spout和bolt的组合，spout和bolt和它们之间的link连接成了一个图，叫做topology。图的顶点(node)为spout或bolt。
topology中每个结点均是并行计算,可以在计算之初指定并行的数目。



### todo
mvn package 可打包成功，但使用jidea会失效 (己解决，删除package再重新下载后ideaj编译成功)
了解storm的ack机制






