# Load Node modules
Q = require 'q'

# Load custom modules
db = require '../mongodb/connect.coffee'
db.projects = db.db.collection 'projects'

# Helpers
errors = require '../helpers/errors.coffee'

# Find a project
exports.readOne = (params) ->
  db.projects.findOne
    _id: params.id
  .then (object) ->
    if object
      ret =
        id: object._id
        name: object.name
    else
      throw new Error errors.build 'A project with that ID was not found.', 404
    return ret

# Find all projects
exports.read = (params) ->
  db.projects.find().toArray()
  .then (object) ->
    ret = []

    for item in object
      ret.push
        id: item._id
        name: item.name

    return ret

# Create new project
exports.create = (params) ->
  db.projects.insert
    _id: db.id()
    name: params.name
  .then (object) ->
    return object._id

# Update a project
exports.update = (params) ->
  db.projects.update
    _id: params.id
  ,
    { $set: params.update }
  .then (res) ->
    if res.ok
      return true
    else
      throw new Error errors.build 'A project with that ID was not found.', 404

# Delete a project
exports.delete = (params) ->
  db.projects.findOne
    _id: params.id
  .then (object) ->
    if object
      db.projects.remove
        _id: params.id
      return true
    else
      throw new Error errors.build 'A project with that ID was not found.', 404
    return ret