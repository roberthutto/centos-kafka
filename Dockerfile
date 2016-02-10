FROM roberthutto/centos-jdk

RUN curl -fL http://mirrors.koehn.com/apache//kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz | tar xzf - -C /opt && \
mv /opt/kafka_2.10-0.8.2.2 /opt/kafka

COPY docker-entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /opt/kafka

#Broker
EXPOSE 9092

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bin/kafka-server-start.sh", "config/server.properties"]