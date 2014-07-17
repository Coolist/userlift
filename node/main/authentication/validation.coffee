# Load modules
validate = require 'validator'
bcrypt = require 'bcrypt-nodejs'

# Load helpers
errors = require '../helpers/errors.coffee'

# GET:Access
exports.getAccess = (req) ->

  sanitized =
    email: req.query.email
    password: req.query.password

  failed = []

  failed.push 'Email is required.' if not sanitized.email?
  failed.push 'Email is invalid.' if not validate.isEmail sanitized.email
  failed.push 'Password is required.' if not sanitized.password?
  failed.push 'Password must be at least 6 characters.' if not validate.isLength sanitized.password, 6

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized

# GET:Request
exports.getRequest = (req) ->

  sanitized =
    token: req.query.token

  failed = []

  failed.push 'Token is required.' if not sanitized.token?

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized

# POST
exports.post = (req) ->

  sanitized =
    name: req.body.name
    email: req.body.email
    password: req.body.password

  failed = []

  failed.push 'Name is required.' if not sanitized.name?
  failed.push 'Email is required.' if not sanitized.email?
  failed.push 'Email is invalid.' if not validate.isEmail sanitized.email
  failed.push 'Password is required.' if not sanitized.password?
  failed.push 'Password must be at least 6 characters.' if not validate.isLength sanitized.password, 6

  if failed.length is 0
    sanitized.password = bcrypt.hashSync sanitized.password

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized

# UPDATE
exports.update = (req) ->

  sanitized =
    password: req.body.password
    token: req.query.token
    update: {}

  sanitized.update.name = req.body.name if req.body.name?
  sanitized.update.email = req.body.email if req.body.email?
  sanitized.update.password = req.body['new_password'] if req.body['new_password']?

  failed = []

  failed.push 'Original password is required.' if not sanitized.password?

  if sanitized.update.email?
    failed.push 'Email is invalid.' if not validate.isEmail sanitized.update.email

  if sanitized.update.password?
    failed.push 'Password must be at least 6 characters.' if not validate.isLength sanitized.update.password, 6

  if failed.length is 0
    sanitized.update.password = bcrypt.hashSync sanitized.update.password

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized

# UPDATE
exports.delete = (req) ->

  sanitized =
    password: req.body.password
    token: req.query.token

  failed = []

  failed.push 'Original password is required.' if not sanitized.password?

  if failed.length > 0
    throw new Error errors.build failed
    return false
  
  return sanitized