var express = require('express');
var app = express();

app.get('/', function (req, res) {
    res.send('Placeholder application is online');
});

app.listen(3000);
