#Angular injectable functions
helpers = angular.module 'HelperModules', []

helpers.factory 'Helpers', [
  '$sce'
  ($sce) ->
    markdownConverter: (source) ->
      converter = new Showdown.converter
      htmlText = converter.makeHtml(source)
      return $sce.trustAsHtml(htmlText)
]
