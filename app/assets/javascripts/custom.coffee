$ ->
  console.log "ahihi"
  $("body").on 'click','.ajax_choose', ->
    value = $(this).data('value')
    target = "#" + $(this).data('target')
    $(target).val(value)
    $('#modal').modal('hide')