
apt-get update
apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs git build-essential

USER_NAME=node
APP_NAME=kanban-js

# setup deploy account
adduser --disabled-password --gecos "Node User" $USER_NAME
passwd -l $USER_NAME

# setup deploy directory
deploy_to=/var/node/$APP_NAME
mkdir -p ${deploy_to}

git clone https://github.com/caspian311/kanban-js.git $deploy_to
pushd $deploy_to &> /dev/null
npm install --production
./node_modules/.bin/jake compile:compile
popd &> /dev/null

chown -R $USER_NAME:$USER_NAME ${deploy_to}

cp /vagrant/node-scripts/node-app /etc/init.d/node-app

update-rc.d node-app defaults 

service node-app start
