$(document).on 'ready page:load', ->

  NProgress.configure {
    showSpinner: true,
    ease: 'ease',
    speed: 500
  }

  menuForm1 = ->
    $('#mainContent').switchClass('col-md-9', 'col-md-11')
    $('#navigation').switchClass('col-md-3', 'col-md-1')
    $('#navigation').find('.text').hide()
    $('#magicCollapse').data('form', 2)

  menuForm2 = ->
    $('#mainContent').switchClass('col-md-11', 'col-md-12')
    $('#navigation').switchClass('col-md-1', '')
    $('#navigation').hide()
    $('#magicCollapse').data('form', 3)

  menuForm3 = ->
    $('#mainContent').switchClass('col-md-12', 'col-md-9', ->
      $('#navigation').addClass('col-md-3')
      $('#navigation').show()
      $('#navigation').find('.text').show()
    )
    $('#magicCollapse').data('form', 1)

  if $('#magicCollapse').length
    $('#magicCollapse').on 'click', ->
      switch $(this).data 'form'
        when 1
          menuForm1()
        when 2
          menuForm2()
        when 3
          menuForm3()
