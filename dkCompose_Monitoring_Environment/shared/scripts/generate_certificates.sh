#!/bin/bash
# Atenção! - Ao executar o script garanta que seja executado pelo container ElasticSearch
# Script para gerar certificados digitais assinados pelo Elasticsearch

yum install openssl -y

/usr/share/elasticsearch/bin/elasticsearch-certutil ca --ca-dn CN=localhost  --pass "changeme" --out /usr/share/elasticsearch/shared/elastic-stack-ca.p12
/usr/share/elasticsearch/bin/elasticsearch-certutil cert --ca /usr/share/elasticsearch/shared/elastic-stack-ca.p12  --pass "" --ca-pass "changeme" --out /usr/share/elasticsearch/shared/elastic-certificates.p12
yes | /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto > /usr/share/elasticsearch/shared/passwords.txt


cp /usr/share/elasticsearch/shared/elastic-certificates.p12 /usr/share/elasticsearch/config/certs
echo "$(</usr/share/elasticsearch/shared/pre-config/elasticsearch.yml)" > /usr/share/elasticsearch/config/elasticsearch.yml 
chmod 444 /usr/share/elasticsearch/config/certs/elastic-certificates.p12 

openssl pkcs12 -in /usr/share/elasticsearch/shared/elastic-certificates.p12 -out /usr/share/elasticsearch/shared/newfile.crt.pem -passin pass:""  -clcerts -nokeys
openssl pkcs12 -in /usr/share/elasticsearch/shared/elastic-certificates.p12 -out /usr/share/elasticsearch/shared/newfile.key.pem -passin pass:"" -nocerts -nodes

