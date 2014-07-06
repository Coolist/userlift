# Angular Common
require 'bower/angular'
require 'bower/angular-route'
require 'bower/angular-resource'

# Init app
experiments = require './experiments'

app = angular.module 'circled', [
  'ngRoute',
  'ngResource',
  experiments.name
]

# Routes
app.config ($routeProvider) ->
  $routeProvider
    .when '/projects/:projectId/experiments',
      controller: 'experimentsCtrl'
      templateUrl: 'experiments/view.html'
    .otherwise
      redirectTo: '/projects/lJsHFS3kZl/experiments'