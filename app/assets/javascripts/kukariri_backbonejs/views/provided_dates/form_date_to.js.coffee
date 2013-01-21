class App.Views.ProvidedDates.FormDateTo extends Backbone.View
  el: ".date_to_activation"
  template: JST["kukariri_backbonejs/templates/provided_dates/_form_date_to"]

  initialize: (options) ->
    @translate = options.translate
    @provided_date = options.provided_date
    @render()

  render: ->
    $(@el).append(Haml.render(@template(), {locals: {provided_date: @provided_date.toJSON(), translate: @translate.toJSON(), page: window.location.hash.split("/")[window.location.hash.split("/").length-1]}}))
    $("#provided_date_date_to").datepicker()

