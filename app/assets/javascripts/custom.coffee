$(document).on 'ready page:load', ->
  $("body").on 'click','.ajax_choose', ->
    value = $(this).data('value')
    img_path = "/assets/" + $(this).data('img')

    target = "#" + $(this).data('target')
    path = "#hero_image"

    $(target).val(value)
    $(path).attr('src', img_path).show()

    $('#modal').modal('hide')

  $("body").on 'click','.divide_choose', ->
    value = $(this).data('value')
    divide = "#hero_divide"

    target = "#" + $(this).data('target')
    sprite_bor = "sprite-bor" + $(this).data('value')

    $(target).val(value)
    $(divide).addClass("#{sprite_bor}").show()

    $('#modal').modal('hide')

  $(document).delegate '.textarea', 'keydown', (e) ->
    keyCode = e.keyCode or e.which
    if keyCode == 9
      console.log("hahah")
      e.preventDefault()
      start = $(this).get(0).selectionStart
      end = $(this).get(0).selectionEnd
      # set textarea value to: text before caret + tab + text after caret
      $(this).val $(this).val().substring(0, start) + "\t" + $(this).val().substring(end)
      # # put caret at right position again
      $(this).get(0).selectionStart = $(this).get(0).selectionEnd = start + 1
    return
