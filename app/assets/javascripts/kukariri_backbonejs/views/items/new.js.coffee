class App.Views.Items.New extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/items/new"]

  initialize: (options) ->
    @item = options.item
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {item: @item}}))

