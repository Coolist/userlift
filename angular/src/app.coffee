# Angular Common
require 'bower/angular'
require 'bower/angular-route'
require 'bower/angular-resource'

# Init app
components =
  experiments: require './experiments'

dependencies = [
  'ngRoute',
  'ngResource'
]

# Add defined compentents to dependencies
for name, component of components
  dependencies.push component.name

app = angular.module 'circled', dependencies

# Routes
app.config ($routeProvider) ->
  $routeProvider
    .when '/projects/:projectId/experiments',
      controller: 'experimentsCtrl'
      templateUrl: 'experiments/view.html'
    .otherwise
      redirectTo: '/projects'