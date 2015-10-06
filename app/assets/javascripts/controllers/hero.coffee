controller = angular.module "HeroModule", []

controller.controller 'HeroDetailCtrl', [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.init = ->
      $scope.LEVELS = $('#data').data('grown-levels')
      $scope.heroLevel = $scope.LEVELS[0].id
      return

    $scope.$watch 'heroLevel', (newValue, oldValue) ->
      level = _.findWhere $scope.LEVELS, {id: $scope.heroLevel}

      $('#strBar').css('width', level.str * 10 + '%').attr('aria-valuenow', level.str).attr('title', "#{level.str}/10").attr('data-original-title', "#{level.str}/10").tooltip('fixTitle')
      $('#intBar').css('width', level.int * 10 + '%').attr('aria-valuenow', level.int).attr('title', "#{level.int}/10").attr('data-original-title', "#{level.int}/10").tooltip('fixTitle')
      $('#agiBar').css('width', level.agi * 10 + '%').attr('aria-valuenow', level.agi).attr('title', "#{level.agi}/10").attr('data-original-title', "#{level.agi}/10").tooltip('fixTitle')
      return

]

controller.controller 'HeroesCtrl', [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.init = ->
      $scope.heroes = $('#data').data 'heroes'
      console.log $scope.heroes
]
