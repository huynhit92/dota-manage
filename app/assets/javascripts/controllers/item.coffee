controller = angular.module "ItemModule", []

controller.controller 'ItemCtrl', [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.init = ->
      $scope.items = $('#data').data('items')
      console.log $rootScope.MASTERS
]