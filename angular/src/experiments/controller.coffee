experimentsCtrl = ($scope, $routeParams, experimentsResource) ->

  $scope.projects = [
    {
      name: 'Cool Project',
      id: 'lJsHFS3kZl'
    },
    {
      name: 'Another',
      id: 'd5l0Nib6pU'
    }
  ]

  $scope.project = $scope.projects[0]

  # Temp loading var
  $scope.loading = true

  experimentsResource.query
    projectId: $scope.project
  , (experiments) ->
    $scope.experiments = experiments
    $scope.loading = false

  $scope.action =
    add: () ->
      name = $scope.input.name
      $scope.input.name = ''
      $scope.loading = true

      if name
        experimentsResource.post
          projectId: $scope.project.id
        ,
          name: name
        , (res) ->
          $scope.experiments.push
            name: name
            id: res.id
            active: false
            archived: false
          $scope.loading = false
    

    delete: (experiment) ->
      $scope.experiments.splice $scope.experiments.indexOf(experiment), 1
      $scope.loading = true

      experimentsResource.delete
        projectId: $scope.project
        experimentId: experiment.id
      , (success) ->
        console.log success
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
  '$scope',
  '$routeParams',
  'experimentsResource',
  experimentsCtrl
]