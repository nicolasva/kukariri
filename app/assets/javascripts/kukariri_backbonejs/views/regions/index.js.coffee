class App.Views.Regions.Index extends Backbone.View
  el: ".actions"
  template: JST["kukariri_backbonejs/templates/regions/_form_select_regions"]

  template_option_value: JST["kukariri_backbonejs/templates/regions/_form_option_regions"]

  initialize: (options) ->
    @initialize_select = true
    @translate = options.translate
    @regions = options.regions
    @render()

  render: ->
    self = @
    $(@el).children().first().children().each (index) ->
      if $(this).children().first().attr("for") == "contact_region"
        $(this).children().last().children().remove()
        self.initialize_select = false
    $(@el).children().first().append(Haml.render(@template(), {locals: {translate: @translate.toJSON()}})) if self.initialize_select
    $.each(@regions.toJSON(), (key, region) ->
      $(self.el).children().first().children().last().children().last().append(Haml.render(self.template_option_value(), {locals: {region: region}}))
    )
    $(self.el).children().first().children().last().children().last().select2()
