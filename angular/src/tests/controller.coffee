testsCtrl = ($scope, $routeParams, $location, testsResource) ->

  # Temp loading var
  $scope.loading = true

  testsResource.query
    projectId: $routeParams.projectId
    experimentId: $routeParams.experimentId
  , (tests) ->
    $scope.tests = tests
    $scope.loading = false

  $scope.action =
    add: ->
      name = $scope.input.name
      $scope.input.name = ''
      $scope.loading = true

      if name
        testsResource.post
          projectId: $routeParams.projectId
          experimentId: $routeParams.experimentId
        ,
          name: name
        , (test) ->
          $scope.tests.push
            name: name
            id: test.id
            active: false
            archived: false
          $scope.loading = false
      else
        $scope.loading = false

    delete: (test) ->
      $scope.tests.splice $scope.tests.indexOf(test), 1
      $scope.loading = true

      testsResource.delete
        projectId: $routeParams.projectId
        experimentId: $routeParams.experimentId
        testId: test.id
      , (success) ->
        $scope.loading = false

    goto:
      project: () ->
        $location.path 'projects/' + $routeParams.projectId

module.exports = [
  '$scope'
  '$routeParams'
  '$location'
  'testsResource'
  testsCtrl
]