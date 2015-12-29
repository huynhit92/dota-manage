controller = angular.module "BlogModule", []

controller.controller 'BlogsCtrl', [
  '$scope'
  '$rootScope'
  'Helpers'
  ($scope, $rootScope, Helpers) ->
    $scope.init = ->
      $scope.blogs = $('#data').data('blogs')
      return

    $scope.view = (blog) ->
      $scope.content = Helpers.markdownConverter(blog.content)
      return
]
