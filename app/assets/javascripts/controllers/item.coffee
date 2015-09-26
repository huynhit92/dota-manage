controller = angular.module "ItemModule", []

controller.controller 'ItemCtrl', [
  '$scope'
  '$rootScope'
  'Item'
  ($scope, $rootScope, Item) ->
    $scope.init = ->
      $scope.items = $('#data').data('items')
    
    $scope.edit = (item) ->
      $scope.errors = []
      $scope.success = null
      $scope.item = angular.copy item
      
      $scope.save = (params) ->
        if params is undefined
          $scope.errors.push "Fill in the form"
          return
        if params.id?
          console.log "dsadsadsa"
          Item.update(item: params).$promise.then ((value) ->
            angular.copy(value, item)
            $scope.item = angular.copy item
            $scope.success = "Saved successfully"
            $scope.errors = []
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        else
          console.log "dafuq"
          Item.create(item: params).$promise.then ((value) ->
            $scope.items.unshift value
            $scope.success = "Saved successfully"
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
]