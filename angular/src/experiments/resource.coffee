api = require '../common/api'

experimentsResource = ($resource) ->
  return $resource api.config.endpoint + '/projects/:projectId/experiments/:experimentId',
    projectId: '@projectId',
    experimentId: '@experimentId'
  ,
    query:
      method: 'GET'
      isArray: true
    get:
      method: 'GET'
    update:
      method: 'PUT'
    delete:
      method: 'DELETE'


module.exports = [
  '$resource',
  experimentsResource
]