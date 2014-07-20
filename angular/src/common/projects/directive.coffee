projects = angular.module 'circled.common.projects', []
projects.factory 'projectsResource', require './resource.coffee'

projectsCtrl = ($scope, $location, $routeParams, projectsResource) ->
  projectsResource.query (projects) ->
    $scope.projects = projects
    $scope.project = $scope.projects[0]

    for project in $scope.projects
      if project.id is $routeParams.projectId
        $scope.project = project


  $scope.action =
    add: ->
      name = $scope.input.project
      $scope.input.project = ''

      if name
        projectsResource.post
          name: name
        , (project) ->
          index = $scope.projects.push
            name: name
            id: project.id

          $scope.action.switch $scope.projects[index - 1]
    switch: (project) ->
      $location.path 'projects/' + project.id
    delete: (project) ->
      if confirm 'Delete project ' + project.name + '?'
        projectsResource.delete
          projectId: project.id
        , () ->
          $scope.projects.splice $scope.projects.indexOf(project), 1

          if $scope.projects.length > 0
            $scope.action.switch $scope.projects[0]
          else
            $location.path 'projects'


projects.directive 'projects', () ->
  restrict: 'E'
  template: require './view.html'
  scope:
    project: '='
  controller: [
    '$scope'
    '$location'
    '$routeParams'
    'projectsResource'
    projectsCtrl
  ]

module.exports = projects