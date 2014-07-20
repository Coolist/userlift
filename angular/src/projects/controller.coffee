projectsCtrl = ($scope, $routeParams, $location, projectsResource) ->
  
  projectsResource.query (projects) ->
    if projects[0]?
      $location.path 'projects/' + projects[0].id
    else
      projectsResource.post
        name: 'Example Project'
      , (project) ->
        $location.path 'projects/' + project.id

module.exports = [
  '$scope'
  '$routeParams'
  '$location'
  'projectsResource'
  projectsCtrl
]