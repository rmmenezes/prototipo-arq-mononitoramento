FROM logstash:7.4.1

RUN logstash-plugin install logstash-filter-json
RUN logstash-plugin install logstash-input-jdbc
RUN /usr/share/logstash/bin/logstash-plugin install --version=3.1.5 logstash-output-mongodb
COPY ./logstash-trasnferencia/config/jdbc-input-mongodb/* /usr/share/logstash/logstash-core/lib/jars/
