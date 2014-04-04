#!/bin/bash

# install node.js
sudo apt-get update
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:chris-pea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

USER_NAME=deploy
APP_NAME=node-couchbase-example

# setup deploy account
sudo adduser --disabled-password --gecos "Deploy User" $USER_NAME
sudo passwd -l $USER_NAME

# setup deploy directory
deploy_to=/var/node/$APP_NAME
sudo mkdir -p ${deploy_to}
sudo chown -R deploy:deploy ${deploy_to}
sudo umask 0002
sudo chmod g+s ${deploy_to}
sudo mkdir ${deploy_to}/{releases,shared}

# setup logging directory
sudo mkdir -p /var/log/node
sudo chown deploy:deploy /var/log/node
