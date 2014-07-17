# Load Node modules
Q = require 'q'
uid = require('rand-token').uid
bcrypt = require 'bcrypt-nodejs'

# Load custom modules
db = require '../mongodb/connect.coffee'
db.accounts = db.db.collection 'accounts'
db.tokens = db.db.collection 'tokens'
check = require './check.coffee'

# Helpers
errors = require '../helpers/errors.coffee'

# Create access token
exports.createAccess = (params) ->

  db.accounts.findOne
    email: params.email
  .then (object) ->
    if not object?
      throw new Error errors.build 'Incorrect email or password.', 400
    else
      if not bcrypt.compareSync params.password, object.password
        throw new Error errors.build 'Incorrect email or password.', 400
    return object
  .then (account) ->
    db.tokens.insert
      type: 'access'
      token: uid 32
      account: account._id

  .then (object) ->
    return object.token

# Create request token
exports.createRequest = (params) ->

  db.tokens.findOne
    token: params.token
  .then (object) ->
    if not object?
      throw new Error errors.build 'Incorrect access token.', 400
    else
      if object.type isnt 'access'
        throw new Error errors.build 'Incorrect access token.', 400
    return object
  .then (token) ->
    db.tokens.insert
      type: 'request'
      token: uid 32
      account: token.account
      expires: new Date Date.now() + 60 * 60 * 24

  .then (object) ->
    return object.token

# Create new account
exports.create = (params) ->

  db.accounts.findOne
    email: params.email
  .then (object) ->
    if object?
      throw new Error errors.build 'An account with that email already exists.', 400
  .then () ->
    db.accounts.insert
      name: params.name
      email: params.email
      password: params.password
      projects: []

  .then (object) ->
    return object

# Update account
exports.update = (params) ->

  check.request params.token
  .then (account) ->
    if not account?
      throw new Error errors.build 'Invalid authentication request token.', 401
    else if not bcrypt.compareSync params.password, account.password
      throw new Error errors.build 'Incorrect original password.', 400
    return account
  .then (account) ->
    db.accounts.update
      _id: account.id
    ,
      { $set: params.update }
  .then (res) ->
    if res.ok
      return true
    else
      throw new Error errors.build 'An account with that ID was not found.', 404

# Delete account
exports.delete = (params) ->

  check.request params.token
  .then (account) ->
    if not account?
      throw new Error errors.build 'Invalid authentication request token.', 401
    else if not bcrypt.compareSync params.password, account.password
      throw new Error errors.build 'Incorrect original password.', 400
    return account
  .then (account) ->
    db.accounts.remove
      _id: account.id
  .then (res) ->
    return true