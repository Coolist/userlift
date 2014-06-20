# Load modules
validate = require 'validator'

exports.post = (req) ->

  sanitized =
    name: req.body.name

  failed = []

  failed.push 'Project name is required.' if not sanitized?

  if failed.length > 0
    throw new Error JSON.stringify failed
    return false
  
  return sanitized