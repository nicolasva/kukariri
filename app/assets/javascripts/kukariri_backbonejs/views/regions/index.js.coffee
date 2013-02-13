class App.Views.Regions.Index extends Backbone.View
  el: ".actions"
  template: JST["kukariri_backbonejs/templates/regions/_form_select_regions"]

  template_option_value: JST["kukariri_backbonejs/templates/regions/_form_option_regions"]

  initialize: (options) ->
    @translate = options.translate
    @regions = options.regions
    @render()

  render: ->
    self = @
    $(@el).children().first().append(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))
    $.each(@regions.toJSON(), (key, region) ->
      $(self.el).children().first().children().last().children().last().append(Haml.render(self.template_option_value(), {locals: {region: region}}))
    )
    $(self.el).children().first().children().last().children().last().select2()
