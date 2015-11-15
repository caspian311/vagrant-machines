
#-------------------------------------------------------
# dependencies
#-------------------------------------------------------

apt-get update
apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nginx nodejs git build-essential

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

#-------------------------------------------------------
# get site content via git
#-------------------------------------------------------

git clone https://github.com/caspian311/kanban-js.git /var/node/kanban-js
cd /var/node/kanban-js
npm install --production
./node_modules/.bin/jake compile:compile
