accountCtrl = ($scope, $routeParams, $location, accountResource, $localStorage) ->
  
  $scope.action =
    signup: () ->
      accountResource.signup
        name: $scope.input.name
        email: $scope.input.email
        password: $scope.input.password
      , (res) ->
        $localStorage.tokenAccess = res.token
        $location.path '/projects'
    login: () ->
      accountResource.login
        email: $scope.input.email
        password: $scope.input.password
      , (res) ->
        $localStorage.tokenAccess = res.token
        $location.path '/projects'

module.exports = [
  '$scope'
  '$routeParams'
  '$location'
  'accountResource'
  '$localStorage'
  accountCtrl
]