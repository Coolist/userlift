experimentsCtrl = ($scope, $routeParams, experimentsResource) ->

  # Temp loading var
  $scope.loading = true

  experimentsResource.query
    projectId: $routeParams.projectId
  , (experiments) ->
    $scope.experiments = experiments
    $scope.loading = false

  $scope.action =
    add: ->
      name = $scope.input.name
      $scope.input.name = ''
      $scope.loading = true

      if name
        experimentsResource.post
          projectId: $routeParams.projectId
        ,
          name: name
        , (experiment) ->
          $scope.experiments.push
            name: name
            id: experiment.id
            active: false
            archived: false
          $scope.loading = false
      else
        $scope.loading = false
    

    delete: (experiment) ->
      if confirm 'Delete experiment ' + experiment.name + '?'
        $scope.experiments.splice $scope.experiments.indexOf(experiment), 1
        $scope.loading = true

        experimentsResource.delete
          projectId: $routeParams.projectId
          experimentId: experiment.id
        , (success) ->
          $scope.loading = false
  

    archive: (experiment) ->
      experiment.archived = true
      $scope.loading = true

      experimentsResource.update
        projectId: $scope.project
        experimentId: experiment.id
      ,
        archived: true
      , () ->
        $scope.loading = false
  

    unarchive: (experiment) ->
      experiment.archived = false
      $scope.loading = true

      experimentsResource.update
        projectId: $scope.project
        experimentId: experiment.id
      ,
        archived: false
      , () ->
        $scope.loading = false
  

    toggleActive: (experiment) ->
      experiment.active = !experiment.active
      $scope.loading = true

      experimentsResource.update
        projectId: $scope.project
        experimentId: experiment.id
      ,
        active: experiment.active
      , () ->
        $scope.loading = false
  

module.exports = [
  '$scope'
  '$routeParams'
  'experimentsResource'
  experimentsCtrl
]