# Projects module
projects = angular.module 'circled.projects', []

# Styles
require './style.scss'

projects.controller 'projectsCtrl', require './controller'
projects.factory 'projectsResource', require '../common/projects/resource'

module.exports = projects