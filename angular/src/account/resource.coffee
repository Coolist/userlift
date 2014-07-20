api = require '../common/api'

accountResource = ($http) ->
  baseUrl: api.config.endpoint + '/authentication'
  signup: (params, res) ->
    self = @
    $http.post @baseUrl, params
    .success (data) ->
      self.login params, (data) ->
        res(data)
    # TO DO: Handle error
  login: (params, res) ->
    $http.get @baseUrl + "/access?email=#{params.email}&password=#{params.password}"
    .success (data) ->
      res(data)
    # TO DO: Handle error

module.exports = [
  '$http',
  accountResource
]