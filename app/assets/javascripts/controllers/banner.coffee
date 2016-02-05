controller = angular.module "BannerModule", []

controller.controller 'BannersCtrl', [
  '$scope'
  '$rootScope'
  'Helpers'
  'Banner'
  ($scope, $rootScope, Helpers, Banner) ->
    $scope.init = ->
      $scope.banners = $("#data").data('banners')
      console.log $scope.banners

]
