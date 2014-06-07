# Load modules
config = require '../../config.json'
pmongo = require 'promised-mongo'
db = pmongo config.database.mongodb.server + '/' + config.database.mongodb.name

exports.db = db