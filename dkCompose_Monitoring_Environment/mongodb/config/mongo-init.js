// Realiza a autenticação no MongoDB usando as credenciais previamente criadas na inicialização
db.auth('root', 'root')


// Indica o nome da base de dados a ser usado pelo usuario a ser criado
db = db.getSiblingDB('database')

// Cria o usuario e indicando as credenciais e premissões de acesso na base de dados indicada
db.createUser({
  user: 'user-mongo',
  pwd: 'password123',
  roles: [
    {
      role: 'root',
      db: 'admin',
    },
  ],
});