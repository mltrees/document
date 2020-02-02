## start standalone storm
storm nimbus&
storm supervisor&
storm ui&
查看storm界面:
http://localhost:8080

## storm tutorial
https://storm.apache.org/releases/current/Tutorial.html

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
mvn package 可打包成功，但使用jidea会失效





