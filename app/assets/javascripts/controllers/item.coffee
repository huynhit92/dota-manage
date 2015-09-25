controller = angular.module "ItemModule", []

controller.controller 'ItemCtrl', [
  '$scope'
  '$rootScope'
  'Item'
  ($scope, $rootScope, Item) ->
    $scope.init = ->
      $scope.items = $('#data').data('items')
    
    $scope.edit = (item) ->
      $scope.errors = null
      $scope.success = null
      $scope.item = angular.copy item
      
      $scope.save = (params) ->
        return if !params?
        if params.id?
          console.log params
          Item.update(item: params).$promise.then ((value) ->
            angular.copy(value, item)
            $scope.item = angular.copy item
            $scope.success = "Saved successfully"
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
]