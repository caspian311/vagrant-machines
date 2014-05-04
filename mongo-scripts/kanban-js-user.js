use kanban-js
db.createUser({
    user: "kanban-js",
    pwd: "password",
    roles: [ { role: "readWrite", db: "kanban-js" } ]
  })
