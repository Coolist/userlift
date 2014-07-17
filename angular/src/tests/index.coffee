# Common
common = [
  require('../common/projects/directive.coffee').name
]

# Tests module
tests = angular.module 'circled.tests', common

# Styles
require './style.scss'

tests.controller 'testsCtrl', require './controller'
tests.factory 'testsResource', require './resource.coffee'

module.exports = tests