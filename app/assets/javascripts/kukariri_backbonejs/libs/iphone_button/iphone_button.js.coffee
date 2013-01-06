App.Libs ||= {}
App.Libs.IphoneButton ||= {}
App.Libs.IphoneButton.IphoneButton ||= {}

class App.Libs.IphoneButton.IphoneButton extends Backbone.View
  initialize: (options) ->
    $(document).ready ->
      $('.iphone-style').live('click', ->
        inputID = '#provided_date_date_to_activation'
        if $(inputID)[0].value == 'false'
          $(this).animate({backgroundPosition: '0% 100%'})
          $(inputID)[0].value = true
          $(this).removeClass('off').addClass('on')
        else
          $(this).animate({backgroundPosition: '100% 0%'})
          $(inputID)[0].value = false
          $(this).removeClass('on').addClass('off')
      )

