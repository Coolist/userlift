# Load modules
validate = require 'validator'

# Load helpers
errors = require '../helpers/errors.coffee'

# POST
exports.post = (req) ->

  sanitized =
    name: req.body.name

  failed = []

  failed.push 'Project name is required.' if not sanitized.name?

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized

# UPDATE
exports.update = (req) ->

  sanitized =
    name: req.body.name
    id: req.params.id

  failed = []

  failed.push 'Project name is required.' if not sanitized.name?

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized