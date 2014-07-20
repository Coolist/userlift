module.exports = (app, router) ->

  # Load Modules
  bodyParser = require 'body-parser'

  # Load Controllers
  track = require './main/tracking/controller.coffee'
  experimentSnippet = require './main/experimentSnippet/compile.coffee'
  authentication = require './main/authentication/controller.coffee'
  project = require './main/projects/controller.coffee'
  experiment = require './main/experiments/controller.coffee'
  test = require './main/tests/controller.coffee'

  pre = '/api/1/'

  # Tracking
  router.get '/e', track.get

  # Experiment snippets
  router.get '/experiments/:id([a-zA-Z0-9]+).js', experimentSnippet.get

  # ---- API ---- #

  # Accounts
  router.post pre + 'authentication', authentication.post
  router.get pre + 'authentication/access', authentication.getAccess
  router.get pre + 'authentication/request', authentication.getRequest
  router.put pre + 'authentication', authentication.update
  router.delete pre + 'authentication', authentication.delete
  router.post pre + 'authentication/reset/request', authentication.postResetRequest
  router.post pre + 'authentication/reset', authentication.postReset

  # Projects
  router.get pre + 'projects/:id', project.getOne
  router.get pre + 'projects', project.get
  router.post pre + 'projects', project.post
  router.put pre + 'projects/:id', project.update
  router.delete pre + 'projects/:id', project.delete

  # Experiments
  router.get pre + 'projects/:projectId/experiments/:id', experiment.getOne
  router.get pre + 'projects/:projectId/experiments', experiment.get
  router.post pre + 'projects/:projectId/experiments', experiment.post
  router.put pre + 'projects/:projectId/experiments/:id', experiment.update
  router.delete pre + 'projects/:projectId/experiments/:id', experiment.delete

  # Tests
  router.get pre + 'projects/:projectId/experiments/:experimentId/tests/:id', test.getOne
  router.get pre + 'projects/:projectId/experiments/:experimentId/tests', test.get
  router.post pre + 'projects/:projectId/experiments/:experimentId/tests', test.post
  router.put pre + 'projects/:projectId/experiments/:experimentId/tests/:id', test.update
  router.delete pre + 'projects/:projectId/experiments/:experimentId/tests/:id', test.delete

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