exports.parse = (string) ->
  r =
    code: 400

  try
    r = JSON.parse string
  catch e
    r.messages = [ string ]

  return r

exports.build = (errors, code) ->
  r =
    code: 400

  if typeof errors is 'string'
    r.messages = [ errors ]
  else
    r.messages = errors

  r.code = code if code?

  return JSON.stringify r

exports.send = (errorObject, res) ->
  error = exports.parse(errorObject.message)

  res.send
    success: false
    messages: error.messages
  , error.code