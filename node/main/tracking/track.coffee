# Load modules
tracker = require '../helpers/tracker.coffee'
db = require '../couchdb/tracker.coffee'

# Tracking pixel
exports.get = (req, res) ->
	db.addPageview(req.query)
	tracker.servePixel(res)