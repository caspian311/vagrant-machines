use admin

db.createUser({
   user: "administrator",
   pwd: "password",
   roles: [ "userAdminAnyDatabase" ]
})
