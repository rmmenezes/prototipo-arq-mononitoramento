#!/bin/bash
if [ -e /usr/share/elasticsearch/elastic-stack-ca.p12 ]
then
    echo "Removendo CA antiga"
    rm -r /usr/share/elasticsearch/elastic-stack-ca.p12
    /usr/share/elasticsearch/bin/elasticsearch-certutil ca --pass "changeme" --out /usr/share/elasticsearch/elastic-stack-ca.p12
else
    /usr/share/elasticsearch/bin/elasticsearch-certutil ca --pass "changeme" --out /usr/share/elasticsearch/elastic-stack-ca.p12
fi

cp /usr/share/elasticsearch/elastic-stack-ca.p12 /usr/share/elasticsearch/shared/elastic-stack-ca.p12

if [ -e /usr/share/elasticsearch/config/certs/elastic-certificates.p12 ]
then
    echo "Removendo certificado antigo"
    rm -r /usr/share/elasticsearch/config/certs/elastic-certificates.p12
    yes | /usr/share/elasticsearch/bin/elasticsearch-certutil cert --ca /usr/share/elasticsearch/elastic-stack-ca.p12  --ca-pass "changeme" --out /usr/share/elasticsearch/config/certs/elastic-certificates.p12
    chmod 444 /usr/share/elasticsearch/config/certs/elastic-certificates.p12 
else
    yes | /usr/share/elasticsearch/bin/elasticsearch-certutil cert --ca /usr/share/elasticsearch/elastic-stack-ca.p12  --ca-pass "changeme" --out /usr/share/elasticsearch/config/certs/elastic-certificates.p12
    chmod 444 /usr/share/elasticsearch/config/certs/elastic-certificates.p12 
fi


#RUN curl -XDELETE "http://localhost:9200/.security-6/doc/reserved-user-elastic" 
#yes | /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto > /usr/share/elasticsearch/shared/passwords.txt
