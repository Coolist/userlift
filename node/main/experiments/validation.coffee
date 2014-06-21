# Load modules
validate = require 'validator'

# Load helpers
errors = require '../helpers/errors.coffee'

# POST
exports.post = (req) ->

  sanitized =
    name: req.body.name
    projectId: req.params.projectId

  failed = []

  failed.push 'Experiment name is required.' if not sanitized.name?

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized

# UPDATE
exports.update = (req) ->

  sanitized =
    id: req.params.id
    update: {}

  sanitized.update.name = req.body.name if req.body.name?
  sanitized.update.active = validate.toBoolean req.body.active if req.body.active?
  sanitized.update.archived = validate.toBoolean req.body.archived if req.body.archived?
  
  return sanitized