# Replace "kafka-topics" 
# by "kafka-topics.sh" or "kafka-topics.bat" based on your system # (or bin/kafka-topics.sh or bin\windows\kafka-topics.bat if you didn't setup PATH / Environment variables)

kafka-topics 

kafka-topics --zookeeper zookeeper:2181 --list 

kafka-topics --zookeeper zookeeper:2181 --topic first_topic --create

kafka-topics --zookeeper zookeeper:2181 --topic first_topic --create --partitions 3

kafka-topics --zookeeper zookeeper:2181 --topic first_topic --create --partitions 3 --replication-factor 2


kafka-topics --zookeeper zookeeper:2181 --topic first_topic --create --partitions 3 --replication-factor 1

kafka-topics --zookeeper zookeeper:2181 --list 

kafka-topics --zookeeper zookeeper:2181 --topic first_topic --describe

kafka-topics --zookeeper zookeeper-1:2181 --topic first_topic_2brokers --create --partitions 3 --replication-factor 2

# broker_id = 1 (in docker-compose.yml)
# sh-4.4$ kafka-topics --zookeeper zookeeper:2181  --topic first_topic --describe
# Topic: first_topic      TopicId: UXoT63PiT6KwRoSV-I4XJQ PartitionCount: 3       ReplicationFactor: 1    Configs:
#         Topic: first_topic      Partition: 0    Leader: 1       Replicas: 1     Isr: 1
#         Topic: first_topic      Partition: 1    Leader: 1       Replicas: 1     Isr: 1
#         Topic: first_topic      Partition: 2    Leader: 1       Replicas: 1     Isr: 1

# example of broker_id = 0 (update docker-compose.yml)
# sh-4.4$ kafka-topics --zookeeper zookeeper:2181 --topic first_topic --describe
# Topic: first_topic      TopicId: DLtakNF-SVesziX2nNVhwg PartitionCount: 3       ReplicationFactor: 1    Configs: 
#     Topic: first_topic      Partition: 0    Leader: 0       Replicas: 0     Isr: 0
#     Topic: first_topic      Partition: 1    Leader: 0       Replicas: 0     Isr: 0
#     Topic: first_topic      Partition: 2    Leader: 0       Replicas: 0     Isr: 0


kafka-topics --zookeeper zookeeper:2181 --topic first_topic --delete


kafka-topics --zookeeper zookeeper:2181 --topic second_topic --create --partitions 6 --replication-factor 1