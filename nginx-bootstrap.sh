#!/bin/bash

# dependencies
sudo apt-get update
sudo apt-get install -y nginx

#-------------------------------------------------------
# create log files
#-------------------------------------------------------

mkdir -p /var/log/nginx

#-------------------------------------------------------
#/etc/nginx/sites-available/node
#-------------------------------------------------------

cat > /etc/nginx/sites-available/node <<'EOF'

# the IP(s) on which your node server is running. I chose port 3000.
upstream node_app {
    server 192.168.33.12:8000;
}

# the nginx server instance
server {
    listen 0.0.0.0:80;
    access_log /var/log/nginx/node_app.log;

    # pass the request to the node.js server with the correct headers and much more can be added, see nginx config options
    location / {
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header Host $http_host;
      proxy_set_header X-NginX-Proxy true;
      proxy_set_header x-user $remote_user;

      proxy_pass http://node_app/;
      proxy_redirect off;
    }
 }
EOF

cd /etc/nginx/sites-enabled
ln -s /etc/nginx/sites-available/node node
