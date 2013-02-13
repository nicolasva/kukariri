class App.Views.Regions.Index extends Backbone.View
  el: ".actions"
  template: JST["kukariri_backbonejs/templates/regions/_form_select_regions"]

  template_option_value_edit: JST["kukariri_backbonejs/templates/regions/_form_option_regions_edit"]

  template_option_value_new: JST["kukariri_backbonejs/templates/regions/_form_option_regions_new"]

  initialize: (options) ->
    @contact = options.contact unless _.isUndefined(options.contact)
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
      unless _.isUndefined(self.contact)
        $(self.el).children().first().children().last().children().last().append(Haml.render(self.template_option_value_new(), {locals: {region: region, contact: self.contact.toJSON()}}))
      else
        $(self.el).children().first().children().last().children().last().append(Haml.render(self.template_option_value_edit(), {locals: {region: region}}))
    )
    $(self.el).children().first().children().last().children().last().select2()
