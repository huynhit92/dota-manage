controller = angular.module "BlogModule", []

controller.controller 'BlogsCtrl', [
  '$scope'
  '$rootScope'
  'Helpers'
  'Blog'
  ($scope, $rootScope, Helpers, Blog) ->
    $scope.init = ->
      $scope.blogs = $('#data').data('blogs')
      return

    $scope.view = (blog) ->
      $scope.content = Helpers.markdownConverter(blog.content)
      return

    $scope.edit = (blog) ->
      $scope.success = null
      $scope.errors = []

      if blog is undefined
        $scope.blog = {}
        $scope.converted = Helpers.markdownConverter("")
      else
        $scope.blog = angular.copy blog
        $scope.converted = Helpers.markdownConverter($scope.blog.content)

      $scope.$watch 'blog.content', ((newValue, oldValue) ->
        $scope.converted = Helpers.markdownConverter($scope.blog.content)
      )

      $scope.save = (params) ->
        if params is undefined
          $scope.errors.push = $scope.MESSAGES.fill_in_error
          return
        if params.id?
          Blog.update(blog: params).$promise.then ((value) ->
            angular.copy value, blog
            $scope.blog = angular.copy blog
            $scope.success = $scope.MESSAGES.save_success
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        else
          Blog.create(blog: params).$promise.then ( (value) ->
            blog = angular.copy value
            $scope.blog = angular.copy value
            $scope.blogs.push blog
            $scope.success = $scope.MESSAGES.save_success
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        return


      return

]
