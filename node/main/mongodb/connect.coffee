# Load modules
config = require '../../config.json'
pmongo = require 'promised-mongo'
db = pmongo config.database.mongodb.server + '/' + config.database.mongodb.name
shortId = require 'shortid'

# Short ID allowed characters
shortId.characters('0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-')

exports.db = db
exports.id = () ->
  return shortId.generate().replace /\-|\+/g, Math.floor Math.random() * 9 + 1

# Ensure an index on tokens
tokens = db.collection 'tokens'

tokens.ensureIndex { token: 1 }