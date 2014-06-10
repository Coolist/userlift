module.exports = (app, router) ->

  # Load Modules
  bodyParser = require 'body-parser'

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
  app.use bodyParser()
  app.use '/', router

  # 404 Fallback
  app.use (req, res) ->
    res.json 404,
      success: false
      message: 'There is no request at this location.'

  # Application errors
  app.use (err, req, res, next) ->
    console.error err.stack

    status = err.status || 500
    res.json status,
      success: false
      message: 'An internal server error has occured. This has been logged in our servers.'