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
  'Hero'
  ($scope, $rootScope, Hero) ->
    $scope.init = ->
      $scope.heroes = $('#data').data 'heroes'
      $scope.images = $('#data').data 'images'

    $scope.edit = (hero) ->
      $(".image-picker").imagepicker()

      $scope.hero = angular.copy hero
      $scope.success = null
      $scope.errors = []
      $scope.chosen = false
      $scope.heroImg = if hero then "assets/heroes/" + hero.img_url else ""

      $scope.chooseImage = (hero) ->
        $scope.chosen = true
        $(".image_picker_selector").show()
        $(".image_picker_selector").on 'click', '.selected' , ->
          console.log ("ahiadshi")
          return
        return


      $scope.save = (params) ->
        if params is undefined
          $scope.errors.push = $scope.MESSAGES.fill_in_error
          return
        if params.id?
          Hero.update(hero: params).$promise.then ((value) ->
            hero = angular.copy value
            angular.copy(value, $scope.hero)
            $scope.success = $scope.MESSAGES.save_success
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return





]
