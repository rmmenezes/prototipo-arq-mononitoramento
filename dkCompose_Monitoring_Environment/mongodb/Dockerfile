FROM mongo:4.2.1

# Copia o arquivo de configuração para dentro do docker
# Este arquivo sera iniciado junto com o container e permite criar novos usuarios 
COPY ./mongodb/config/mongo-init.js /docker-entrypoint-initdb.d/

# Os seguintes comandos configuram a aplicação Logstash no container
# Sera realizado a instalção de algumas dependencias e a instação do Logstash
# bem como a configuração e inicialização do desta aplicação
RUN apt-get update -y && apt-get install default-jre wget netbase apt-transport-https -y
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN apt-get update && apt-get install logstash
RUN /usr/share/logstash/bin/logstash-plugin install --version=3.1.5 logstash-output-mongodb
RUN mkdir /etc/logstash/certs
RUN service logstash start
RUN service logstash restart