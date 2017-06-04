docker run -e MESOS_ZK=zk://192.168.16.129:2181/mesos --name mesos.master --net host mesos-master:1.2.0 mesos-master --work_dir=/tmp --quorum=1
