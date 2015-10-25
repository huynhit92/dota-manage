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
