# Load Node modules
Q = require 'q'

# Load custom modules
db = require '../mongodb/connect.coffee'
db.accounts = db.db.collection 'accounts'
db.tokens = db.db.collection 'tokens'

# Helpers
errors = require '../helpers/errors.coffee'

# Check request token and return account
exports.request = (token) ->
  db.tokens.findOne
    token: token
  .then (object) ->
    if object?
      db.accounts.findOne
        _id: object.account
    else
      throw new Error errors.build 'Invalid authentication request token.', 401
  .then (account) ->
    if account?
      return {
        id: account._id
        name: account.name
        email: account.email
        projects: account.projects
        password: account.password
      }
    else
      throw new Error errors.build 'Invalid authentication request token.', 401