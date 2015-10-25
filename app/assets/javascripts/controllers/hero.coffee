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
  'RelHeroGrownLevel'
  'RelHeroDivide'
  ($scope, $rootScope, Hero, RelHeroGrownLevel, RelHeroDivide) ->

    $scope.init = ->
      $scope.heroes = $('#data').data 'heroes'
      $scope.images = $('#data').data 'images'

    $scope.edit = (hero) ->
      $(".image-picker").imagepicker()
      $scope.hero = angular.copy hero
      $scope.success = null
      $scope.errors = []
      $scope.chosen = false
      $scope.heroImg = if hero then hero.methods_json.img_path else ""

      $scope.chooseImage = () ->
        $scope.chosen = true
        $(".thumbnail").removeClass('selected')
        $(".image_picker_selector").find("img[src$='#{$scope.heroImg}']").closest('.thumbnail').addClass('selected')
        $(".image_picker_selector").show()
        $(".image_picker_selector").on 'dblclick', 'li' , ->
          $scope.heroImg = $(this).find('.image_picker_image').attr('src')
          $scope.hero.img_url = $scope.heroImg.split('heroes/')[1]
          $scope.$apply()
          $(".image_picker_selector").hide()
          return
        return

      $scope.save = (params) ->
        if params is undefined
          $scope.errors.push = $scope.MESSAGES.fill_in_error
          return
        if params.id?
          Hero.update(hero: params).$promise.then ((value) ->
            angular.copy value, hero
            $scope.hero = angular.copy hero
            $scope.success = $scope.MESSAGES.save_success
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        else
          Hero.create(hero: params).$promise.then ( (value) ->
            hero = angular.copy value
            $scope.hero = angular.copy value
            $scope.heroes.push hero
            $scope.success = $scope.MESSAGES.save_success
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        return

      $scope.saveRelGrownLevel = (params) ->
        RelHeroGrownLevel.update(rel_hero_grown_level: params, hero_id: hero.id).$promise.then ((value) ->
          angular.copy value, params
          $scope.level = angular.copy params
          $scope.success = $scope.MESSAGES.save_success
          $scope.errors = null
          return
        ), (error) ->
          $scope.errors = error.data
          $scope.success = null
          return
        return

      $scope.createRelGrownLevel = (params) ->
        params.hero_id = $scope.hero.id
        RelHeroGrownLevel.create(rel_hero_grown_level: params, hero_id: $scope.hero.id).$promise.then ( (value) ->
          $scope.new_level = {}
          $scope.hero.rel_hero_grown_levels.push value
          $scope.success = $scope.MESSAGES.save_success
          return
        ), (error) ->
          $scope.errors = error.data
          $scope.success = null
          return
        return

      $scope.deleteRelGrownLevel = (params, index) ->
        RelHeroGrownLevel.delete(id: params.id, hero_id: hero.id).$promise.then ((value) ->
          $scope.hero.rel_hero_grown_levels.splice(index, 1)
          $scope.success = $scope.MESSAGES.save_success
          $scope.errors = null
          return
        ), (error) ->
          $scope.errors = error.data
          $scope.success = null
          return
        return

      $scope.saveRelDivide = (params) ->
        RelHeroDivide.update(rel_hero_divide: params, hero_id: hero.id).$promise.then ((value) ->
          angular.copy value, params
          $scope.level = angular.copy params
          $scope.success = $scope.MESSAGES.save_success
          $scope.errors = null
          return
        ), (error) ->
          $scope.errors = error.data
          $scope.success = null
          return
        return

      $scope.createRelDivide = (params) ->
        params.hero_id = $scope.hero.id
        RelHeroDivide.create(rel_hero_divide: params, hero_id: $scope.hero.id).$promise.then ( (value) ->
          $scope.new_divide = {}
          $scope.hero.rel_hero_divides.push value
          $scope.success = $scope.MESSAGES.save_success
          return
        ), (error) ->
          $scope.errors = error.data
          $scope.success = null
          return
        return

      $scope.deleteRelDivide = (params, index) ->
        RelHeroDivide.delete(id: params.id, hero_id: hero.id).$promise.then ((value) ->
          $scope.hero.rel_hero_divides.splice(index, 1)
          $scope.success = $scope.MESSAGES.save_success
          $scope.errors = null
          return
        ), (error) ->
          $scope.errors = error.data
          $scope.success = null
          return
        return


]
