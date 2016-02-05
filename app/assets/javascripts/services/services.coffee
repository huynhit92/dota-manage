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
      query:
        method: 'GET'
        params:
          searchParams: '@searchParams'
        paramSerializer: '$httpParamSerializerJQLike'
        isArray: true
        url: '/json/items?:searchParams'
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

services.factory 'Blog', [
  '$resource'
  ($resource) ->
    $resource '/blogs/:id', {},
      update:
        method: 'PUT'
        params: {id: '@blog.id'}
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

services.factory 'RelSetItem', [
  '$resource'
  ($resource) ->
    $resource '/heroes/:hero_id/rel_hero_divides/:rel_hero_divide_id/item_sets/:item_set_id/rel_set_items/:id', {},
      update:
        method: 'PUT'
        params:
          hero_id: '@hero_id'
          rel_hero_divide_id: '@rel_hero_divide_id'
          item_set_id: '@item_set_id'
          id: '@rel_set_item.id'
      create:
        method: 'POST'
        params:
          hero_id: '@hero_id'
          rel_hero_divide_id: '@rel_hero_divide_id'
          item_set_id: '@item_set_id'
      delete:
        method: 'DELETE'
        params:
          hero_id: '@hero_id'
          rel_hero_divide_id: '@rel_hero_divide_id'
          item_set_id: '@item_set_id'
          id: '@id'
]

services.factory 'Skill', [
  '$resource'
  ($resource) ->
    $resource '/heroes/:hero_id/skills/:id', {},
      update:
        method: 'PUT'
        params:
          hero_id: '@hero_id'
          id: '@skill.id'
      create:
        method: 'POST'
        params:
          hero_id: '@hero_id'
      delete:
        method: 'DELETE'
        params:
          hero_id: '@hero_id'
          id: '@id'
]

services.factory 'Banner', [
  '$resource'
  ($resource) ->
    $resource '/banners/:id', {},
      update:
        method: 'PUT'
        params: {id: '@item.id'}
      create:
        method: 'POST'
      query:
        method: 'GET'
        params:
          searchParams: '@searchParams'
        paramSerializer: '$httpParamSerializerJQLike'
        isArray: true
        url: '/json/items?:searchParams'
]
