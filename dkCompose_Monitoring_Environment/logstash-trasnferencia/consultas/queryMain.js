// --- Informações para uso --- \\

// O logstash de transferencia realiza uma conexão com a base de dados MongoDB
// o usuario pode por meio do presente aqruivo "queryMain.js" construir 
// consultas no-sql personalizadas e direcionar o resultado para um indice
// no elasticsearch.

// Filtros e alteraçoes mais personalizadas podem ser descritas no arquivo de pipeline
// "main.conf"

// Exemplo de consulta:
// db.getCollection('rafael').find({ },{'_id': false})