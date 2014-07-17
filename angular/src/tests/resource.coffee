api = require '../common/api'

testsResource = ($resource) ->
  return $resource api.config.endpoint + '/projects/:projectId/experiments/:experimentId/tests/:testId',
    projectId: '@projectId'
    experimentId: '@experimentId'
    testId: '@testId'
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
  testsResource
]