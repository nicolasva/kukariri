class App.Views.ProvidedDates.Form extends Backbone.View
  template: JST["kukariri_backbonejs/templates/provided_dates/_form"]

  el_date_to_activation: ".date_to_activation"
  template_form_date_to: JST["kukariri_backbonejs/templates/provided_dates/_form_date_to"]
  events:
    "click #provided_date_date_to_activation" : "checked_date_to_activation"
    "click #span_provided_date_date_to_activation" : "checkbox_checked_for_activation"

  initialize: (options) ->
    @provided_date = options.provided_date
    @el = options.el
    @render()

  render: ->
    @el.append(Haml.render(@template(), {locals: {provided_date: @provided_date.toJSON()}}))
    $("#provided_date_at").datepicker()

  checked_date_to_activation: (event) ->
    if $(event.target).attr("checked") == "checked"
      $(event.target).attr("value", true)
      $(@el_date_to_activation).append(Haml.render(@template_form_date_to(), {locals: {provided_date: @provided_date.toJSON()}}))
      $("#provided_date_date_to").datepicker()
    else
      $(event.target).attr("value", false)
      $(@el_date_to_activation).children().last().remove()

  checkbox_checked_for_activation: (event) ->
    if $("#provided_date_date_to_activation").is(':checked')
      $("#provided_date_date_to_activation").attr("checked", false)
    else 
      $("#provided_date_date_to_activation").attr("checked", true)

