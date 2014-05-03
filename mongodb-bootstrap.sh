apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install -y --force-yes mongodb-org 

cat /vagrant/mongo-scripts/admin-user.js | mongo
cat /vagrant/mongo-scripts/admin-user.js | mongo -u administrator -p 'P@$$W0rd' admin

sed -i '/#auth = true/c\auth = true' /etc/mongod.conf

service mongo restart
