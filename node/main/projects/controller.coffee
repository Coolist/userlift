# Load Node modules
Q = require 'q'

# Load related model/response
model = require './model.coffee'
validate = require './validation.coffee'

# GET Project by ID
exports.getOne = (req, res) ->
  id = req.params.id

# GET projects (shared with user)
exports.get = (req, res) ->
  
# POST new projects
exports.post = (req, res) ->

  Q.fcall () ->
    validate.post req
  .then (sanitized) ->
    model.create sanitized
  .then () ->
    res.send
      success: true
      messages: ['Project successfully created.']
    , 200
  .fail (error) ->

    try
      m = JSON.parse error.message
    catch e
      m = [ error.message ]

    res.send
      success: false
      messages: m
    , 400
  .done()

  id = req.params.id

# UPDATE project by ID
exports.update = (req, res) ->

# DELETE project by ID
exports.delete = (req, res) ->
  id = req.params.id