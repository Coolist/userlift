# Load Node modules
Q = require 'q'

# Load related model/response
model = require './model.coffee'
validate = require './validation.coffee'

# Helpers
errors = require '../helpers/errors.coffee'

# GET experiment by ID
exports.getOne = (req, res) ->

  Q.fcall () ->
    model.readOne
      projectId: req.params.projectId
      id: req.params.id
  .then (response) ->
    res.send response, 200
  .fail (error) ->
    errors.send error, res
  .done()

# GET experiments by experiment ID
exports.get = (req, res) ->

  Q.fcall () ->
    model.read
      projectId: req.params.projectId
  .then (response) ->
    res.send response, 200
  .fail (error) ->
    errors.send error, res
  .done()
  
# POST new experiment
exports.post = (req, res) ->

  Q.fcall () ->
    validate.post req
  .then (sanitized) ->
    model.create sanitized
  .then (id) ->
    res.send
      success: true
      messages: [ 'Experiment successfully created.' ]
      id: id
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# UPDATE experiment by ID
exports.update = (req, res) ->
  Q.fcall () ->
    validate.update req
  .then (sanitized) ->
    model.update sanitized
  .then () ->
    res.send
      success: true
      messages: [ 'Experiment successfully updated.' ]
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# DELETE experiment by ID
exports.delete = (req, res) ->
  Q.fcall () ->
    model.delete
      id: req.params.id
  .then (response) ->
    res.send
      success: true
      messages: [ 'Experiment successfully deleted.' ]
  .fail (error) ->
    errors.send error, res
  .done()