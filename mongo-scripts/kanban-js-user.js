use kanban-js
db.createUser({
    user: "kanban-js",
    pwd: "P@$$W0rd",
    roles: [ { role: "readWrite", db: "kanban-js" } ]
  })
