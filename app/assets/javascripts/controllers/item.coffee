controller = angular.module "ItemModule", []

controller.controller 'ItemCtrl', [
  '$scope'
  '$rootScope'
  'Item'
  ($scope, $rootScope, Item) ->
    $scope.init = ->
      $scope.items = $('#data').data 'items'
      $scope.images = $('#data').data 'images'

    $scope.edit = (item) ->
      $(".image-picker").imagepicker()
      $scope.errors = []
      $scope.success = null
      $scope.item = angular.copy item
      $scope.chosen = false
      $scope.itemImg = if item then item.methods_json.img_path else ""

      $scope.chooseImage = () ->
        $scope.chosen = true
        $(".thumbnail").removeClass('selected')
        $(".image_picker_selector").find("img[src$='#{$scope.itemImg}']").closest('.thumbnail').addClass('selected')
        $(".image_picker_selector").show()
        $(".image_picker_selector").on 'dblclick', 'li' , ->
          $scope.itemImg = $(this).find('.image_picker_image').attr('src')
          $scope.item.img_url = $scope.itemImg.split('items/')[1]
          $scope.$apply()
          $(".image_picker_selector").hide()
          return
        return

      $scope.save = (params) ->
        if params is undefined
          $scope.errors.push "Fill in the form"
          return
        if params.id?
          Item.update(item: params).$promise.then ((value) ->
            angular.copy value, item
            $scope.item = angular.copy item
            $scope.success = "Saved successfully"
            $scope.errors = []
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
        else
          Item.create(item: params).$promise.then ((value) ->
            item = angular.copy value
            $scope.item = angular.copy value
            $scope.items.unshift item
            $scope.success = "Saved successfully"
            $scope.errors = null
            return
          ), (error) ->
            $scope.errors = error.data
            $scope.success = null
            return
          return
]
