use admin

db.createUser({
   user: "administrator",
   pwd: "password",
   roles: [ { role: "root", db: "admin" } ]
})
