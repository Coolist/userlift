# Load Node modules
Q = require 'q'

# Load custom modules
db = require '../mongodb/connect.coffee'
db.projects = db.db.collection 'projects'

# Helpers
errors = require '../helpers/errors.coffee'

# Find single project
exports.readOne = (params) ->
  db.projects.findOne
    _id: params.id
  .then (object) ->
    if object
      ret =
        success: true
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
        success: true
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
    name: params.name
  .then (object) ->
    if object
      return true
    else
      throw new Error errors.build 'A project with that ID was not found.', 404