# Angular Common
require 'bower/angular'
require 'bower/angular-route'
require 'bower/angular-resource'
require 'bower/ngstorage'

# Init app
components = [
  require './common/authentication'
  require './account'
  require './projects'
  require './experiments'
  require './tests'
]

dependencies = [
  'ngRoute',
  'ngResource'
  'ngStorage'
]

# Add defined compentents to dependencies
for component in components
  dependencies.push component.name

app = angular.module 'circled', dependencies

# Routes
app.config ($routeProvider) ->
  $routeProvider
    .when '/account/login',
      controller: 'accountCtrl'
      templateUrl: 'account/login/view.html'
    .when '/account/signup',
      controller: 'accountCtrl'
      templateUrl: 'account/signup/view.html'
    .when '/projects',
      controller: 'projectsCtrl'
      templateUrl: 'projects/view.html'
    .when '/projects/:projectId',
      controller: 'experimentsCtrl'
      templateUrl: 'experiments/view.html'
    .when '/projects/:projectId/experiments/:experimentId',
      controller: 'testsCtrl'
      templateUrl: 'tests/view.html'
    .otherwise
      redirectTo: '/projects'