wait_for_db() {
   echo "wating for db to startup..."
   retval=1
   while [ "$retval" -ne "0" ]
   do
      mongo --eval 'version()' &> /dev/null
      retval=$?
   done
}

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install -y --force-yes mongodb-org 

wait_for_db

cat /vagrant/mongo-scripts/admin-user.js | mongo localhost/admin

sed -i '/#auth = true/c\auth = true' /etc/mongod.conf

service mongod restart

wait_for_db

cat /vagrant/mongo-scripts/kanban-js-user.js | mongo -u administrator -p 'P@$$W0rd' localhost/admin


