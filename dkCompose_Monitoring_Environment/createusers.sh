### SCRIPT PARA CRIAR LOGIN E SENHAS PARA OS COMPONENTES(CLIENTES) QUE SE CONECTAM AO ELASTICSEACH ###

## Muda a senha do usuario padrão elastic que foi utilizado para iniciar a arquitetura
curl -k -u elastic:KhC3HlYbilCB1RX3TUyr -X POST "https://localhost:9200/_security/user/elastic/_password?pretty" -H 'Content-Type: application/json' -d'
{
  "password" : "KhC3HlYbilCB1RX3TUyr"
}
'

## Cria o usuario rafael:rafael
curl -k -u elastic:KhC3HlYbilCB1RX3TUyr -X POST "https://localhost:9200/_security/user/rafael?pretty" -H 'Content-Type: application/json' -d'
{
  "password" : "rafael",
  "roles" : [ "superuser" ],
  "full_name" : "SuperUser Rafael"
}
'
## Cria o usuario rafael_kibana:password
curl -k -u elastic:KhC3HlYbilCB1RX3TUyr -X POST "https://localhost:9200/_security/user/rafael_kibana?pretty" -H 'Content-Type: application/json' -d'
{
  "password" : "password",
  "roles" : [ "kibana_user", "superuser"],
  "full_name" : "Kibana User"
}
'
## Cria o usuario logstash_de_borda:X56uUvYrOQ7crf1LBSin
curl -k -u elastic:KhC3HlYbilCB1RX3TUyr -X POST "https://localhost:9200/_security/user/logstash_de_borda?pretty" -H 'Content-Type: application/json' -d'
{
  "password" : "X56uUvYrOQ7crf1LBSin",
  "roles" : [ "logstash_system" ],
  "full_name" : "Logstash de Borda"
}
'
