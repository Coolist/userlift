# Load Node modules
Q = require 'q'

# Load custom modules
db = require '../mongodb/connect.coffee'
db.experiments = db.db.collection 'experiments'
db.tests = db.db.collection 'tests'

# Helpers
errors = require '../helpers/errors.coffee'

# Find a test
exports.readOne = (params) ->
  db.tests.findOne
    _id: params.id
  .then (object) ->
    if object
      ret =
        id: object._id
        name: object.name
        color: object.color

      # FILL THIS IN

    else
      throw new Error errors.build 'A test with that ID was not found.', 404
    return ret

# Find all tests
exports.read = (params) ->
  db.tests.find
    experiment: params.experimentId
  .toArray()
  .then (object) ->
    ret = []

    for item in object
      ret.push
        id: item._id
        name: item.name
        color: item.color
        
        # FILL THIS IN

    return ret

# Create new test
exports.create = (params) ->
  testId = db.id()

  db.experiments.findOne
    _id: params.experimentId
  .then (object) ->
    if not object
      throw new Error errors.build 'An experiment with that ID was not found.', 404
  .then () ->
    db.tests.insert
      _id: testId
      experiment: params.experimentId
      name: params.name
      color: params.color
      
      # FILL THIS IN

  .then (object) ->
    return object._id

# Update a experiment
exports.update = (params) ->
  db.tests.update
    _id: params.id
  ,
    { $set: params.update }
  .then (res) ->
    if res.ok
      return true
    else
      throw new Error errors.build 'A test with that ID was not found.', 404

# Delete a experiment
exports.delete = (params) ->
  db.tests.findOne
    _id: params.id
  .then (object) ->
    if object
      db.tests.remove
        _id: params.id
      return true
    else
      throw new Error errors.build 'A test with that ID was not found.', 404
    return ret