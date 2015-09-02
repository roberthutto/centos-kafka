FROM roberthutto/centos-jdk

RUN curl -fL https://www.apache.org/dyn/closer.cgi?path=/kafka/0.8.2.1/kafka_2.10-0.8.2.1.tgz | tar xzf - -C /opt && \
mv /opt/kafka_2.10-0.8.2.1 /opt/kafka

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /opt/kafka

#Broker
EXPOSE 9092

CMD ["bin/kafka-server-start.sh", "config/server.properties"]