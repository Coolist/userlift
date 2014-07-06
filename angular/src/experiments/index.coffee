# Experiments
experiments = angular.module 'circled.experiments', []

require './style.scss'

experiments.controller 'experimentsCtrl', require './controller'
experiments.factory 'experimentsResource', require './resource.coffee'

module.exports = experiments