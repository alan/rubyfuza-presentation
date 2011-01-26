var http = require('http');
var nack = require('nack');

var app = nack.createProcess("config.ru");

http.createServer(function (req, res) {
    app.proxyRequest(req, res);
}).listen(3000, "127.0.0.1");
