###
 > ================================================================\
 >> @MainPageController
 > ================================================================/
###

mainPageController = ($scope, $state, localStorageService) ->
  lg 'CONTROLLER: in mainPageController'

angular.module('BoilerApp').controller 'mainPageController', mainPageController

mainPageController.$inject = [
  '$scope'
  '$state'
  'localStorageService'
]