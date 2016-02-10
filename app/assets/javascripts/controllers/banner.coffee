controller = angular.module "BannerModule", []

controller.controller 'BannersCtrl', [
  '$scope'
  '$rootScope'
  'Helpers'
  'Banner'
  'Blog'
  ($scope, $rootScope, Helpers, Banner, Blog) ->
    $scope.init = ->
      $scope.banners = $("#data").data('banners')
      console.log $scope.banners
      return

    $scope.edit = (banner) ->
      console.log !!$scope.result

      BANNER_BLOG = 1
      BANNER_IMAGE = 2

      $scope.success = null
      $scope.errors = []
      $scope.banner = angular.copy banner
      $scope.bannerType = if (banner? && banner.blog_id?) then BANNER_BLOG else BANNER_IMAGE

      $scope.isBannerBlog = () ->
        return $scope.bannerType is BANNER_BLOG

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

      $scope.search = () ->
        params =
          q:
            title_cont: $scope.search.title_cont
            blog_category_id_eq: $scope.search.blog_category_id
            s: "id desc"

        Blog.query(params).$promise.then ( (value) ->
          console.log value
          $scope.result = value
        )
        return

      $scope.setBlogId = (blog_id) ->
        $scope.banner = {} unless $scope.banner
        $scope.banner.blog_id = blog_id
        $scope.result = null
        return






]
