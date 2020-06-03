FROM mongo:4.2.1

# Copia o arquivo de configuração para dentro do docker
# Este arquivo sera iniciado junto com o container e permite criar novos usuarios 
COPY ./mongodb/config/mongo-init.js /docker-entrypoint-initdb.d/