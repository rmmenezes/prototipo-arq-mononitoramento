// Realiza a autenticação no MongoDB usando as credenciais previamente criadas na inicialização
db.auth('root', 'root')


> db.createUser({
  user: 'ian',
  pwd: 'secretPassword',
  roles: [{ role: 'readWrite', db:'cool_db'}]
})