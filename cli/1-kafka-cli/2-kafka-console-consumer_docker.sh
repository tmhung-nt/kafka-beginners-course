# Replace "kafka-console-consumer" 
# by "kafka-console-consumer.sh" or "kafka-console-consumer.bat" based on your system # (or bin/kafka-console-consumer.sh or bin\windows\kafka-console-consumer.bat if you didn't setup PATH / Environment variables)

kafka-console-consumer 

# consuming
kafka-console-consumer --bootstrap-server kafka:9092 --topic first_topic

# other terminal
kafka-console-producer --broker-list kafka:9092 --topic first_topic

# consuming from beginning
kafka-console-consumer --bootstrap-server kafka:9092 --topic first_topic --from-beginning

# groups
kafka-console-consumer --bootstrap-server kafka:9092 --topic first_topic --group my-frist-group


# producer with key
kafka-console-producer --broker-list kafka:9092 --topic second_topic --property parse.key=true --property key.separator=,

# consumer with key
kafka-console-consumer --bootstrap-server kafka:9092 --topic second_topic --from-beginning --property print.key=true --property key.separator=,
