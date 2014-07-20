api = require '../api'

interceptor = ($q, $injector, $location, $localStorage) ->
  request: (config) ->
    http = $injector.get '$http'
    deferred = $q.defer()

    if config.params? and config.params.auth
      config.params.auth = undefined

      if $localStorage.tokenRequest? and new Date($localStorage.tokenRequest.expires).getTime() > Date.now()
        config.params.token = $localStorage.tokenRequest.token
        deferred.resolve config
      else if $localStorage.tokenAccess?
        tokenAccess = $localStorage.tokenAccess

        http
          method: 'GET'
          url: api.config.endpoint + "/authentication/request?token=#{tokenAccess}"
        .success (data, status) ->
          config.params.token = data.token

          $localStorage.tokenRequest =
            token: data.token
            expires: data.expires

          deferred.resolve config
        .error () ->
          $localStorage.tokenAccess = undefined
          $localStorage.tokenRequest = undefined
          $location.path 'account/login'
      else
        $location.path 'account/login'
    else
      deferred.resolve config

    return deferred.promise

  response: (res) ->
    deferred = $q.defer()

    if res.status is 401
      $localStorage.tokenRequest = undefined if $localStorage.tokenRequest?
      $localStorage.tokenAccess = undefined if $localStorage.tokenAccess?
      $location.path 'account/login'
    else
      deferred.resolve res

    return deferred.promise

module.exports = [
  '$q'
  '$injector'
  '$location'
  '$localStorage'
  interceptor
]