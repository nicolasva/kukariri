class App.Views.ProvidedDates.Form extends Backbone.View
  template: JST["kukariri_backbonejs/templates/provided_dates/_form"]

  initialize: (options) ->
    @provided_date = options.provided_date
    @el = options.el
    @render()

  render: ->
    @el.append(Haml.render(@template(), {locals: {provided_date: @provided_date.toJSON()}}))
