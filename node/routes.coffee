module.exports = (app, router) ->

  # Load Modules
  bodyParser = require 'body-parser'

  # Load Controllers
  track = require './main/tracking/controller.coffee'
  experiment = require './main/experimentSnippet/compile.coffee'
  project = require './main/projects/controller.coffee'

  pre = '/api/1/'

  # Tracking
  router.get '/e', track.get

  # Experiment snippets
  router.get '/experiments/:id([a-zA-Z0-9]+).js', experiment.get

  # ---- API ---- #

  # Projects
  router.get pre + 'projects/:id', project.getOne
  router.get pre + 'projects', project.get
  router.post pre + 'projects', project.post
  router.put pre + 'projects/:id', project.update
  router.delete pre + 'projects/:id', project.delete

  # Allow all origins for API
  app.use (req, res, next) ->

    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type')

    next()
  app.use bodyParser()
  app.use '/', router

  # 404 Fallback
  app.use (req, res) ->
    res.json 404,
      success: false
      messages: ['There is no request at this location.']

  # Application errors
  app.use (err, req, res, next) ->
    console.error err.stack

    status = err.status || 500
    res.json status,
      success: false
      messages: ['An internal server error has occured. This has been logged in our servers.']