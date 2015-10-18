controller = angular.module "RelSetItemModule", []

controller.controller 'RelSetItemCtrl', [
  '$scope'
  '$rootScope'
  'RelSetItem'
  'Item'
  ($scope, $rootScope, RelSetItem, Item) ->
    $scope.init = ->
      $scope.rel_hero_divide = $('#data').data('rel')
      return

    $scope.edit = (rel_set_item) ->
      $scope.success = null
      $scope.errors = []

      $scope.rel_set_item = angular.copy rel_set_item

      $scope.save = (params) ->
        if params is undefined
          $scope.errors.push = $scope.MESSAGES.fill_in_error
          return
        if params.id?
          RelSetItem.update(hero_id: $scope.rel_hero_divide.hero_id, rel_hero_divide_id: $scope.rel_hero_divide.id, item_set_id: $scope.rel_hero_divide.item_set.id, rel_set_item: params).$promise.then ((value) ->
            angular.copy value, rel_set_item
            $scope.rel_set_item = angular.copy rel_set_item
            $scope.success = $scope.MESSAGES.save_success
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        else
          params.item_set_id = $scope.rel_hero_divide.item_set.id
          RelSetItem.create(hero_id: $scope.rel_hero_divide.hero_id, rel_hero_divide_id: $scope.rel_hero_divide.id, item_set_id: $scope.rel_hero_divide.item_set.id, rel_set_item: params).$promise.then ( (value) ->
            rel_set_item = angular.copy value
            $scope.rel_set_item = angular.copy value
            $scope.rel_hero_divide.item_set.rel_set_items.push rel_set_item
            $scope.success = $scope.MESSAGES.save_success
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
          return
        return

    $scope.searchItem = ->
      return if $scope.itemSearch is undefined
      console.log $scope.itemSearch
      Item.query(name: $scope.itemSearch).$promise.then ( (value) ->
        console.log value
      )

]
