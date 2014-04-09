#!/bin/bash

# dependencies
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-auth-kerb libapache2-mod-proxy-html

# on domain controller
# ktpass -princ HTTP/node-app.bridge.lan@BRIDGE.LAN -mapuser BRIDGE\HTTP-apacheserver -pass P@$$W0rd -out HTTP-apacheserver.keytab


# apache2 configuration

#----------------------------------------------------------
# /etc/apache2/sites-available/node
#----------------------------------------------------------
cat > /etc/apache2/sites-available/node << EOF

ServerName node-app

ProxyRequests Off
<Proxy *>
        Order deny,allow
        Allow from all
</Proxy>

<Location /node>
        ProxyPass http://localhost:8000
        ProxyPassReverse http://localhost:8000

        AuthType Kerberos
        AuthName "Kerberos Login"
        KrbMethodNegotiate On
        KrbMethodK5Passwd On
        KrbAuthRealms BRIDGE.LAN
        Krb5KeyTab /etc/apache2/HTTP-apacheserver.keytab
        require valid-user

        RewriteEngine On
        RewriteCond %{LA-U:REMOTE_USER} (.+)
        RewriteRule . - [E=RU:%1]
        RequestHeader set X-Remote-User "%{RU}e" env=RU
</Location>
EOF

cd /etc/apache2/sites-enabled
ln -s /etc/apache2/sites-available/node node

a2enmod proxy
a2enmod proxy_http
a2enmod headers
a2enmod rewrite