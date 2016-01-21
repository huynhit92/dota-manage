controller = angular.module "BannerModule", []

controller.controller 'BannersCtrl', [
  '$scope'
  '$rootScope'
  'Helpers'
  'Banner'
  ($scope, $rootScope, Helpers, Banner) ->
    $scope.init = ->
      console.log ("huehuehue")

]
