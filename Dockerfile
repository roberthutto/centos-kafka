FROM roberthutto/centos-jdk

RUN curl -fL https://www.apache.org/dyn/closer.cgi?path=/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz | tar xzf - -C /opt && \
mv /opt/kafka_2.10-0.8.2.1 /opt/kafka

RUN sed -i -e 's|'broker.id=0'|'broker.id=$BROKER_ID'|g' /opt/kafka/config/server.properties
RUN sed -i -e 's|'zookeeper.connect=localhost:2181'|'zookeeper.connect=$ZOOKEEPER_HOST_NAMES'|g' /opt/kafka/config/server.properties

WORKDIR /opt/kafka

EXPOSE 9092
CMD ["bin/kafka-server-start.sh", "config/server.properties"]