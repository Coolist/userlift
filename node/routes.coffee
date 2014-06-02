module.exports = (app, router) ->

	# Load Modules

	# Load Controllers
	track = require './main/tracking/track.coffee'

	pre = '/1/'

	# Tracking
	router.get '/e', track.get

	# Allow all origins for API
	app.use (req, res, next) ->

		res.setHeader('Access-Control-Allow-Origin', '*')
		res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE')
		res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type')

		next()

	app.use '/', router

	# 404 Fallback
	app.use (req, res) ->
		res.status(404)

		res.send('404 Not Found')