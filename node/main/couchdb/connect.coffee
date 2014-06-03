# Load modules
config = require('../../config.json')
nano = require('nano')('http://' + config.database.couchdb.server + ':' + config.database.couchdb.port)

exports.db = nano.use(config.database.couchdb.name)