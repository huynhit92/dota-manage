controller = angular.module "BannerModule", []

controller.controller 'BannersCtrl', [
  '$scope'
  '$rootScope'
  'Helpers'
  'Banner'
  ($scope, $rootScope, Helpers, Banner) ->
    $scope.init = ->
      $scope.banners = $("#data").data('banners')
      return

    $scope.edit = (banner) ->
      
      $scope.success = null
      $scope.errors = []
      $scope.banner = angular.copy banner

      $scope.save = (params) ->
        if _.isEmpty params
          $scope.errors.push $scope.MESSAGES.fill_in_error
          return
        if params.id?
          Banner.update(banner: params).$promise.then ((value) ->
            angular.copy value, banner
            $scope.banner = angular.copy banner
            $scope.success = $scope.MESSAGES.save_success
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        else
          Banner.create(banner: params).$promise.then ( (value) ->
            banner = angular.copy value
            $scope.banner = angular.copy value
            $scope.banners.push banner
            $scope.success = $scope.MESSAGES.save_success
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        return






]
