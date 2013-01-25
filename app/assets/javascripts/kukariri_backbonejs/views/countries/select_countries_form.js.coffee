class App.Views.Countries.SelectCountriesForm extends Backbone.View
  el: ".actions"
  template: JST["kukariri_backbonejs/templates/countries/_form_select_countries"]

  template_option_value: JST["kukariri_backbonejs/templates/countries/_form_option_countries"]
  initialize: (options) ->
    @countries = options.countries
    @translate = options.translate
    @render()

  render: ->
    self = @
    $(@el).children().first().append(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))
    
    $.each(@countries.toJSON(), (key, countrie) ->
      $(self.el).children().first().children().last().children().last().append(Haml.render(self.template_option_value(), {locals: {countrie: countrie}}))
    )
    #$(@el).append(Haml.render(@template))

