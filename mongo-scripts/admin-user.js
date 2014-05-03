use admin

db.createUser({
   user: 'administrator',
   pwd: 'P@$$W0rd',
   roles: [ { role: 'root', db: 'admin' } ]
})
