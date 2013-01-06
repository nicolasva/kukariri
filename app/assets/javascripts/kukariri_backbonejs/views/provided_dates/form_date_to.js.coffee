class App.Views.ProvidedDates.FormDateTo extends Backbone.View
  el: ".date_to_activation"
  template: JST["kukariri_backbonejs/templates/provided_dates/_form_date_to"]

  initialize: (options) ->
    @provided_date = options.provided_date
    @render()

  render: ->
    $(@el).append(Haml.render(@template(), {locals: {provided_date: @provided_date.toJSON()}}))

