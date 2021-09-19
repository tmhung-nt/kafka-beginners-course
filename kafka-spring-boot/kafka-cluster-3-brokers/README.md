# Kafka Spring Boot  

## References  
- https://nab.udemy.com/course/apache-kafka-for-developers-using-springboot/  
- https://github.com/dilipsundarraj1/kafka-for-developers-using-spring-boot/blob/master/SetUpKafka.md  

## Simple kafka cluster
1. Bring up Zookeeper and single Kafka cluster  
` cd simple-kafka-cluster; docker-compose up -d  `

2. Open logs  
` docker-compose logs -f zookeeper  `
` docker-compose logs -f kafka  `

3. Attach to kafka container  
` docker exec -it kafka bash  `

4. Create topic without attaching to kafka container  
- Create topic
` docker exec -it kafka bash -c "kafka-topics --create --topic test-topic -zookeeper zookeeper:2181 --replication-factor 1 --partitions 4" `  
- List all topics 
` kafka-topics --list --zookeeper zookeeper:2181`
- Describe a topic  
` kafka-topics --describe --zookeeper zookeeper:2181 --topic test-topic  --replication-factor 1 --partitions 4kafk`

5. Instantiate a Producer/Consumer without key  
  5.1 Producer  
` kafka-console-producer --broker-list kafka:9092 --topic test-topic  `  
  5.2 Consumer  
    - Consume from the first offset  
` kafka-console-consumer --bootstrap-server kafka:9092 --topic test-topic --from-beginning`  
    - Consume from the last offset  
` kafka-console-consumer --bootstrap-server kafka:9092 --topic test-topic  `  
    - Consume Group  
` kafka-console-consumer --bootstrap-server kafka:9092 --topic test-topic --group test-group`  

## Kafka Cluster with 3 brokers
1. Create topic
`docker exec -it kafka1 bash -c "kafka-topics --create --zookeeper zookeeper:32181 --replication-factor 3 --partitions 3 --topic test-topic"`

2. Delete topic  
`kafka-topics --zookeeper zookeeper:32181 --delete --topic test-topic`

3. Instantiate a Producer/Consumer with key  
  3.1 Producer  
` kafka-console-producer --broker-list kafka1:29092 --topic test-topic --property "key.separator=-" --property "parse.key=true"`  
  3.2 Consumer  
    - Consume from the first offset  
` kafka-console-consumer --bootstrap-server kafka1:29092 --topic test-topic --from-beginning -property "key.separator= - " --property "print.key=true" `  
    - Consume from the last offset  
` kafka-console-consumer --bootstrap-server kafka1:29092 --topic test-topic -property "key.separator= - " --property "print.key=true" `  
    - Consume Group  
` kafka-console-consumer --bootstrap-server kafka1:29092 --topic test-topic --group test-group --property "key.separator=-" --property "parse.key=true"`  

4. Send message to producer using bash
> for x in {1..10}; do echo "key$x-content $SECONDS"; sleep 1; done | kafka-console-producer --broker-list kafka1:29092 --topic test-topic   

> 