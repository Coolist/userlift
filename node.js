//Define modules/config
var express = require('express'),
	coffee = require('coffee-script/register'),
	app = express();

if (coffee) {} // Make JS hint happy (temporary)

//Setup express
app.use(express.static(__dirname + '/static'));

//Load routes
require('./node/routes')(app, express.Router());

//Start server
app.listen(3000);

console.log('Node server running on port 3000');