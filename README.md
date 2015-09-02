# centos-kafka


docker run --name some-kafka -e BROKER_ID=1 -e ZOOKEEPER_HOST_NAMES=Node1:2181,Node2:2181 -p 2181:2181 -p 2888:2888 -p 3888:3888 -d roberthutto/centos-kafka