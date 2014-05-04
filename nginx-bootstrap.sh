
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

cp /vagrant/nginx-config/node /etc/nginx/sites-available/node

cd /etc/nginx/sites-enabled
ln -s /etc/nginx/sites-available/node node

service nginx restart
