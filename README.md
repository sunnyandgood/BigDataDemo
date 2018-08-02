# 第一个大数据项目————大数据之网站访问数据分析

### 一、项目成果展示

* 项目展示之饼状图

    <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/pie.png"/></div>

* 项目展示之柱状图

    <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/bar1.png"/></div>

* 项目展示之柱状图

    <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/bar2.png"/></div>

### 二、项目前期准备

* 前期准备之集群搭建

    <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/VM.png"/></div>
  
   * 一号机：jdk 、hadoop、hbase<进程：Jps、NameNode、DFSZKFailoverController>
  
   * 二号机：jdk 、hadoop、hbase<进程：Jps、NameNode、DFSZKFailoverController>
  
   * 三号机：jdk 、hadoop、hbase、hive、sqoop<进程：ResourceManager>
  
   * 四号机：jdk、hadoop、hbase、zookeeper<进程： DataNode 、 QuorumPeerMain 、 NodeManager 、 JournalNode >
  
   * 五号机：jdk、hadoop、hbase、zookeeper、mysql <进程： DataNode 、 QuorumPeerMain 、 NodeManager 、 JournalNode >
  
   * 六号机：jdk、hadoop、hbase、zookeeper<进程： DataNode 、 QuorumPeerMain 、 NodeManager 、 JournalNode >
  
   * 七号机：jdk、flume

* 前期准备之数据处理

   * 原数据(执行：“bin/flume-ng agent -n a4 -c conf -f conf/a4.conf -Dflume.root.logger=INFO,console”启动flume)
   
        <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/shuju2.png"/></div>

   * 通过flume将数据导入到HDFS中，用cleaner.jar清洗后存入mysql数据库，再导入物理机数据库，以供展示。

        <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/50070.png"/></div>

   * 执行步骤
   
        * 第一步：执行脚本a1.sh将数据清洗：
        
                CURRENT=`/bin/date +%Y%m%d` 
                /softWare/hadoop-2.2.0/bin/hadoop  jar  /cleaner.jar  /flume/$CURRENT /cleaned/$CURRENT 

        * 第二步：创建外部分区表并执行脚本a2.sh将数据导入数据库：

                create external table wxkj(ip string,time string,urls string) partitioned by (logdate string) 
                                           row format delimited fields terminated by '\t' location '/cleaned';

                CURRENT=`/bin/date +%Y%m%d` 
                /softWare/apache-hive0.13.0-bin/bin/hive  -e  "alter table wxkj  add partition 
                                        (logdate=$CURRENT)  location '/cleaned/$CURRENT' "

        * 第三步：执行a3.sh筛选需要的数据

                CURRENT=`/bin/date +%Y%m%d` 
                /softWare/apache-hive-0.13.0-bin/bin/hive -e "create table vip_$CURRENT 
                    row format delimited fields terminated by '\t' as select ip, count(*) 
                        as vtimes from wxkj where logdate = $CURRENT group by ip having 
                                            vtimes >= 50 order by vtimes desc limit 20"

        * 第四步：在物理机创建表，并执行a4.sh将数据导入物理机数据库：

                CREATE TABLE `vip` (
                 `ip` varchar(100) NOT NULL, 
                `times` varchar(255) NOT NULL, 
                PRIMARY KEY (`ip`) 
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

                CURRENT=`/bin/date +%Y%m%d`
                 /softWare/sqoop-1.4.4.bin__hadoop-2.0.4-alpha/bin/sqoop export 
                 --connect jdbc:mysql://192.168.2.1:3306/yan --username root 
                 --password root --export-dir "/user/hive/warehouse/vip_$CURRENT" 
                 --table vip --fields-terminated-by '\t'

* 处理后的数据

    <div align="center"><img src="https://github.com/sunnyandgood/BigDataDemo/blob/master/file/vip.png"/></div>

