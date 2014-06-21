//Define modules/config
var express = require('express'),
  app = express(),
  config = require('./node/config.json');

// Run Coffeescript
require('coffee-script/register')

//Setup express
app.use(express.static(__dirname + '/static'));

//Load routes
require('./node/routes')(app, express.Router());

//Start server
app.listen(3000);

console.log('Node ' + config.server + ' server running on port 3000');