# Load Node modules
Q = require 'q'

# Load custom modules
db = require '../mongodb/connect.coffee'
db.projects = db.db.collection 'projects'
db.experiments = db.db.collection 'experiments'

# Helpers
errors = require '../helpers/errors.coffee'

# Find a experiment
exports.readOne = (params) ->
  db.experiments.findOne
    _id: params.id
  .then (object) ->
    if object
      ret =
        id: object._id
        name: object.name
        tests: object.tests
        visitors: object.visitors
        active: object.active
        archived: object.archived
    else
      throw new Error errors.build 'An experiment with that ID was not found.', 404
    return ret

# Find all experiments
exports.read = (params) ->
  db.experiments.find().toArray()
  .then (object) ->
    ret = []

    for item in object
      ret.push
        id: item._id
        name: item.name
        tests: item.tests
        visitors: item.visitors
        active: item.active
        archived: item.archived

    return ret

# Create new experiment
exports.create = (params) ->
  experimentId = db.id()

  db.projects.findOne
    _id: params.projectId
  .then (object) ->
    if not object
      throw new Error errors.build 'A project with that ID was not found.', 404
  .then () ->
    db.experiments.insert
      _id: experimentId
      project: params.projectId
      name: params.name
      visitors: 0
      tests: 0
      active: false
      archived: false
  .then (object) ->
    return object._id

# Update a experiment
exports.update = (params) ->
  db.experiments.update
    _id: params.id
  ,
    { $set: params.update }
  .then (res) ->
    if res.ok
      return true
    else
      throw new Error errors.build 'An experiment with that ID was not found.', 404

# Delete a experiment
exports.delete = (params) ->
  db.experiments.findOne
    _id: params.id
  .then (object) ->
    if object
      db.experiments.remove
        _id: params.id
      return true
    else
      throw new Error errors.build 'An experiment with that ID was not found.', 404
    return ret