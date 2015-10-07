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

services.factory 'Hero', [
  '$resource'
  ($resource) ->
    $resource '/heroes/:id', {},
      update:
        method: 'PUT'
        params: {id: '@hero.id'}
      create:
        method: 'POST'
]
