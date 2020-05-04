# hadoop tutorial



Typically the compute nodes and the storage nodes are the same, that  is, the MapReduce framework and the Hadoop Distributed File System (see [HDFS Architecture Guide](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsDesign.html)) are running on the same set of nodes. This configuration allows the  framework to effectively schedule tasks on the nodes where data is  already present, resulting in very high aggregate bandwidth across the  cluster.



# run hadoop with official jar

hadoop jar /Users/zhangmaolin1/java_project_home/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.10.0.jar wordcount input output

