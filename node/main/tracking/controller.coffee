# Load related model/response
model = require './model.coffee'
response = require './response.coffee'

# Tracking pixel
exports.get = (req, res) ->
  type = req.query.type || ''

  switch type
    when 'pageview'
      model.addPageview req.query
  response.servePixel res