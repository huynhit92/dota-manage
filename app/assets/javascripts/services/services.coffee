services = angular.module "Services", []

services.factory 'Item', [
  '$resource'
  ($resource) ->
    $resource '/items/:id', {},
      update:
        method: 'PUT'
        params: {id: '@item.id'}
      create:
        method: 'POST'
]