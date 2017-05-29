###
 > ================================================================\
 >> @MainModule
 > ================================================================/
###

hrApp = angular.module('BoilerApp', [
  'ui.router'
  'LocalStorageModule'
])

hrApp.config [
  '$stateProvider'
  '$urlRouterProvider'

  ($stateProvider, $urlRouterProvider) ->
    lg "in hrApp.config"
    $urlRouterProvider.otherwise 'main'
    
    $stateProvider.state 'main',
      url: '/main'
      templateUrl: 'views/main.component.html'
      controller: 'mainPageController'

    return
]

hrApp.run [
  '$rootScope'
  '$location'
  '$state'
  '$http'
  '$templateCache'
  'localStorageService'

  ($rootScope, $location, $state, $http, $templateCache, localStorageService) ->
    lg "in hrApp.run"

    $rootScope.$on '$locationChangeStart', (event, next, current) ->
      # called when state changes
      return

    $rootScope.$on '$stateChangeSuccess', (ev, to, toParams, from, fromParams) ->
      # state change detail can be found here
      return

    $rootScope.$on '$viewContentLoaded', ->
      # template cache
      $templateCache.removeAll()
      return

    return
]

@lg = (message) ->
  console.log message
  return