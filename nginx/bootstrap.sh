#!/bin/bash

# install pre-reqs
sudo apt-get install -y vim git build-essential libldap-dev

mkdir temp
cd temp

git clone https://github.com/kvspb/nginx-auth-ldap.git
cd nginx-auth-ldap
git checkout v0.1 -b v0.1
cd ..

wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.35.tar.gz
tar zxvf pcre-8.35.tar.gz

# get nginx source
wget http://nginx.org/download/nginx-1.4.7.tar.gz
tar zxvf nginx-1.4.7.tar.gz
cd nginx-1.4.7

# build nginx
./configure --add-module=../nginx-auth-ldap --with-pcre=../pcre-8.35
make
sudo make install