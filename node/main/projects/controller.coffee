# Load Node modules
Q = require 'q'

# Load related model/response
model = require './model.coffee'
validate = require './validation.coffee'

# Helpers
errors = require '../helpers/errors.coffee'

# GET Project by ID
exports.getOne = (req, res) ->

  Q.fcall () ->
    model.findOne
      id: req.params.id
  .then (response) ->
    res.send response, 200
  .fail (error) ->
    errors.send error, res
  .done()

# GET projects (shared with user)
exports.get = (req, res) ->

  Q.fcall () ->
    model.find()
  .then (response) ->
    res.send response, 200
  .fail (error) ->
    errors.send error, res
  .done()
  
# POST new projects
exports.post = (req, res) ->

  Q.fcall () ->
    validate.post req
  .then (sanitized) ->
    model.create sanitized
  .then (id) ->
    res.send
      success: true
      messages: ['Project successfully created.']
      id: id
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# UPDATE project by ID
exports.update = (req, res) ->
  id = req.params.id

# DELETE project by ID
exports.delete = (req, res) ->
  id = req.params.id