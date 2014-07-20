# Account module
account = angular.module 'circled.account', []

# Styles
require './style.scss'

account.controller 'accountCtrl', require './controller'
account.factory 'accountResource', require './resource'

module.exports = account