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

services.factory 'RelHeroGrownLevel', [
  '$resource'
  ($resource) ->
    $resource '/heroes/:hero_id/rel_hero_grown_levels/:id', {},
      update:
        method: 'PUT'
        params:
          hero_id: '@hero_id'
          id: '@rel_hero_grown_level.id'
      create:
        method: 'POST'
        params:
          hero_id: '@hero_id'
      delete:
        method: 'DELETE'
        params:
          hero_id: '@hero_id'
          id: '@rel_hero_grown_level.id'
]

services.factory 'RelHeroDivide', [
  '$resource'
  ($resource) ->
    $resource '/heroes/:hero_id/rel_hero_divides/:id', {},
      update:
        method: 'PUT'
        params:
          hero_id: '@hero_id'
          id: '@rel_hero_divide.id'
      create:
        method: 'POST'
        params:
          hero_id: '@hero_id'
      delete:
        method: 'DELETE'
        params:
          hero_id: '@hero_id'
          id: '@rel_hero_divide.id'
]
