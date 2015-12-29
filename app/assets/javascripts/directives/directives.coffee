directive = angular.module('Directives', [])

directive.directive 'markdown', ->
  converter = new Showdown.converter
  restrict: 'E'
  link: (scope, element, attrs) ->
    console.log(element)
    htmlText = converter.makeHtml(element.text())
    element.html htmlText
    return
