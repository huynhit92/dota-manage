filters = angular.module 'Filters', []

filters.filter 'cut', ->
  (value, wordwise, max, tail) ->
    if !value
      return ''
    max = parseInt(max, 10)
    return value if !max
    # if value.length <= max
    #   return value
    # value = value.substr(0, max)
    # if wordwise
    #   lastspace = value.lastIndexOf(' ')
    #   if lastspace != -1
    #     value = value.substr(0, lastspace)
    # value + (tail or ' …')
