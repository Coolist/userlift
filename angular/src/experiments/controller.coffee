experimentsCtrl = ($scope, $routeParams, experimentsResource) ->
  $scope.project = $routeParams.projectId

  $scope.experiments = experimentsResource.query
    projectId: $scope.project

module.exports = [
  '$scope',
  '$routeParams',
  'experimentsResource',
  experimentsCtrl
]