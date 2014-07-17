# Load Node modules
Q = require 'q'

# Load related model/response
model = require './model.coffee'
validate = require './validation.coffee'

# Helpers
errors = require '../helpers/errors.coffee'

# GET:Access - Get an access token
exports.getAccess = (req, res) ->

  Q.fcall () ->
    validate.getAccess req
  .then (sanitized) ->
    model.createAccess sanitized
  .then (token) ->
    res.send
      success: true
      token: token
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# GET:Request - Get a request token
exports.getRequest = (req, res) ->

  Q.fcall () ->
    validate.getRequest req
  .then (sanitized) ->
    model.createRequest sanitized
  .then (token) ->
    res.send
      success: true
      token: token
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# POST - Create new account
exports.post = (req, res) ->

  Q.fcall () ->
    validate.post req
  .then (sanitized) ->
    model.create sanitized
  .then (account) ->
    res.send
      success: true
      messages: [ 'Account successfully created.' ]
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# UPDATE - Update an account
exports.update = (req, res) ->

  Q.fcall () ->
    validate.update req
  .then (sanitized) ->
    model.update sanitized
  .then (account) ->
    res.send
      success: true
      messages: [ 'Account successfully updated.' ]
    , 200
  .fail (error) ->
    errors.send error, res
  .done()

# DELETE - Delete an account
exports.delete = (req, res) ->

  Q.fcall () ->
    validate.delete req
  .then (sanitized) ->
    model.delete sanitized
  .then (account) ->
    res.send
      success: true
      messages: [ 'Account successfully deleted.' ]
    , 200
  .fail (error) ->
    errors.send error, res
  .done()