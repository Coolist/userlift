# Load modules
tracker = require '../helpers/tracker.coffee'
db = require '../couchdb/tracker.coffee'
totalUser = require '../couchdb/query/totalUser.coffee'

exports.testDeleteMe = (req, res) ->
	totalUser.getTest (content) ->
		res.json content

# Tracking pixel
exports.get = (req, res) ->
	db.addPageview req.query
	tracker.servePixel res