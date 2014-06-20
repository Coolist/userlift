# Load Node modules
Q = require 'q'

# Load custom modules
db = require('../mongodb/connect.coffee').db
db.projects = db.collection 'projects'

# Create new project
exports.create = (params) ->
  db.projects.insert
    _id: db.id
    name: params.name
  .then (object) ->
    return object._id