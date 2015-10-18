controller = angular.module "RelHeroDivideModule", []

controller.controller 'RelHeroDivideCtrl', [
  '$scope'
  '$rootScope'
  'ItemSet'
  ($scope, $rootScope, ItemSet) ->
    $scope.init = ->
      $scope.rel_hero_divide = $('#data').data('rel')
      console.log $scope.rel_hero_divide
      return

    $scope.edit = (item_set) ->

      $scope.save = (params) ->
        if params.id?

        else
          Hero.create(hero: params).$promise.then ( (value) ->
            $scope.hero = angular.copy value
            $scope.heroes.push value
            $scope.success = $scope.MESSAGES.save_success
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
]
