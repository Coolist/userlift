api = require '../common/api'

experimentsResource = ($resource) ->
  $resource api.config.endpoint + '/projects/:projectId/experiments/:experimentId',
    projectId: '@projectId'
    experimentId: '@experimentId'
    auth: true
  ,
    query:
      method: 'GET'
      isArray: true
    post:
      method: 'POST'
    get:
      method: 'GET'
    update:
      method: 'PUT'
    delete:
      method: 'DELETE'


module.exports = [
  '$resource'
  experimentsResource
]