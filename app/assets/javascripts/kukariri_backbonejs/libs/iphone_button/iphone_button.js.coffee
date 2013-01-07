App.Libs ||= {}
App.Libs.IphoneButton ||= {}
App.Libs.IphoneButton.IphoneButton ||= {}

class App.Libs.IphoneButton.IphoneButton extends Backbone.View
  initialize: (options) ->
    self = @
    @provided_date = options.provided_date
    $(document).ready ->
      $('.iphone-style').live('click', ->
        inputID = '#provided_date_date_to_activation'
        if $(inputID)[0].value == 'false'
          $(this).animate({backgroundPosition: '0% 100%'}, 0, -> 
            $(".date_to_activation").children().last().remove()
          )
          $(inputID)[0].value = true
          $(this).removeClass('off').addClass('on')
        else
          $(this).animate({backgroundPosition: '100% 0%'}, 0, ->
            @viewProvidedDatesFormDateTo = new App.Views.ProvidedDates.FormDateTo({provided_date: self.provided_date})
          )
          $(inputID)[0].value = false
          $(this).removeClass('on').addClass('off')
      )

