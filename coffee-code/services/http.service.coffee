###
 > ================================================================\
 >> @httpService
 > ================================================================/
###

http = ($http) ->
  lg "HTTP Service Initiated"
  that = this

  @sendHttpReq = (reqUri, reqMethod, reqData, callBackFn) ->
    $http(
      method: reqMethod
      url: globalUrlBase + globalUrlPrefix + reqUri
      headers:
        'accept': 'application/json'
      data: reqData
    ).then ((response) ->
      # this callback will be called asynchronously
      lg 'GOT SuccessCallback'
      callBackFn response
      return
    ), (response) ->
      # called asynchronously if an error occurs
      lg 'GOT ErrorCallback: ' + response.status
      callBackFn response
      return
    return

  return

angular.module('BoilerApp').service 'http', http

http.$inject = [
  '$http'
]