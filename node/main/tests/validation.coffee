# Load modules
validate = require 'validator'
tinycolor = require 'tinycolor2'

# Load helpers
errors = require '../helpers/errors.coffee'

# POST
exports.post = (req) ->

  sanitized =
    name: req.body.name
    color: req.body.color
    experimentId: req.params.experimentId

  failed = []

  failed.push 'Test name is required.' if not sanitized.name?

  if sanitized.color?
    failed.push 'Test color is invalid' if not validate.isHexColor sanitized.color
  else
    color = tinycolor
      h: Math.round Math.random() * 360
      s: Math.floor Math.random() * 21 + 70
      l: (Math.floor Math.random() * 31 + 40) / 100

    sanitized.color = color.toHexString().toUpperCase()

  sanitized.color = '#' + sanitized.color if sanitized.color[0] isnt '#'
  sanitized.color.toUpperCase()

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
  sanitized.update.color = req.body.color if req.body.color?

  failed = []

  if sanitized.update.color?
    failed.push 'Test color is invalid' if not validate.isHexColor sanitized.update.color
    sanitized.update.color = '#' + sanitized.update.color if sanitized.update.color[0] isnt '#'
    sanitized.update.color.toUpperCase()

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized