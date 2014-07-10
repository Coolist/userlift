# Load Node modules
Q = require 'q'

# Load related model/response
model = require './model.coffee'
validate = require './validation.coffee'

# Helpers
errors = require '../helpers/errors.coffee'

# GET test by ID
exports.getOne = (req, res) ->

  Q.fcall () ->
    model.readOne
      experimentId: req.params.experimentId
      id: req.params.id
  .then (response) ->
    res.send response, 200
  .fail (error) ->
    errors.send error, res
  .done()

# GET tests by test ID
exports.get = (req, res) ->

  Q.fcall () ->
    model.read
      experimentId: req.params.experimentId
  .then (response) ->
    res.send response, 200
  .fail (error) ->
    errors.send error, res
  .done()
  
# POST new test
exports.post = (req, res) ->

  Q.fcall () ->
    validate.post req
  .then (sanitized) ->
    model.create sanitized
  .then (id) ->
    res.send
      success: true
      messages: [ 'Test successfully created.' ]
      id: id
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# UPDATE test by ID
exports.update = (req, res) ->
  Q.fcall () ->
    validate.update req
  .then (sanitized) ->
    model.update sanitized
  .then () ->
    res.send
      success: true
      messages: [ 'Test successfully updated.' ]
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# DELETE test by ID
exports.delete = (req, res) ->
  Q.fcall () ->
    model.delete
      id: req.params.id
  .then (response) ->
    res.send
      success: true
      messages: [ 'Test successfully deleted.' ]
  .fail (error) ->
    errors.send error, res
  .done()