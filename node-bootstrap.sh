
# install latest nodejs
apt-get update
apt-get install -y software-properties-common python-software-properties
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs

USER_NAME=node
APP_NAME=example-app

# setup deploy account
adduser --disabled-password --gecos "Node User" $USER_NAME
passwd -l $USER_NAME

# setup deploy directory
deploy_to=/var/node/$APP_NAME
mkdir -p ${deploy_to}

cat > ${deploy_to}/app.js <<-'EOF'
var http = require('http');

var server = http.createServer(function (request, response) {
   console.log('Received request');
   response.writeHead(200, {"Content-Type": "text/plain"});
   response.end("Hello World\n");
});

var port = 8000;
server.listen(port, function() {
   console.log('node listening on port: ' + port);
});

EOF

chown -R deploy:deploy ${deploy_to}
