# Load modules
tracker = require '../helpers/tracker.coffee'
db = require '../mongodb/tracker.coffee'

# Tracking pixel
exports.get = (req, res) ->
  type = req.query.type || ''

  switch type
    when 'pageview'
      db.addPageview req.query
  tracker.servePixel res