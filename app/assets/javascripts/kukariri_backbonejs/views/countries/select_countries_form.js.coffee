class App.Views.Countries.SelectCountriesForm extends Backbone.View
  el: ".actions"
  template: JST["kukariri_backbonejs/templates/countries/_form_select_countries"]

  events: 
    "change #contact_country" : "select_regions"

  template_option_value: JST["kukariri_backbonejs/templates/countries/_form_option_countries"]
  
  initialize: (options) ->
    @countries = options.countries
    @translate = options.translate
    @regions = options.regions
    @render()

  render: ->
    self = @
    $(@el).children().first().append(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))

    $.each(@countries.toJSON(), (key, countrie) ->
      $(self.el).children().first().children().last().children().last().append(Haml.render(self.template_option_value(), {locals: {countrie: countrie}}))
    )
    $(self.el).children().first().children().last().children().last().select2()

  select_regions: (event) ->
    self = @
    country_name = $(".select2-choice").children().first().html()
    @regions.country_name = country_name
    @regions.fetch 
      success: (collection, response) ->
        @viewRegionsIndex = new App.Views.Regions.Index({regions: collection, translate: self.translate})

