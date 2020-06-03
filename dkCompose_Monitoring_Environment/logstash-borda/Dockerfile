FROM logstash:7.4.1

RUN logstash-plugin install logstash-filter-json
RUN /usr/share/logstash/bin/logstash-plugin install --version=3.1.5 logstash-output-mongodb
