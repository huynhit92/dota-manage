filters = angular.module 'Filters', []

filters.filter 'cut', ->
  (value, wordwise, max, tail) ->
    if !value
      return ''
    max = parseInt(max, 10)
    return value if !max
    return value if value.length <= max
    value = value.substr(0, max)
    if wordwise
      lastspace = value.lastIndexOf(' ')
    if lastspace != -1
      value = value.substr(0, lastspace)
    value += if tail? then tail else ' ...'
    return value
