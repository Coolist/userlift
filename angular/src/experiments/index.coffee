# Common
common = [
  require('../common/projects/directive.coffee').name
]

# Experiments module
experiments = angular.module 'circled.experiments', common

# Styles
require './style.scss'

experiments.controller 'experimentsCtrl', require './controller'
experiments.factory 'experimentsResource', require './resource.coffee'

module.exports = experiments