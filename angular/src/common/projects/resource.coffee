api = require '../api'

projectsResource = ($resource) ->
  return $resource api.config.endpoint + '/projects/:projectId',
    projectId: '@projectId',
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
  '$resource',
  projectsResource
]