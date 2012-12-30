class App.Views.Contacts.Index extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/index"]

  initialize: (options) ->
    @item_id = options.item_id
    @type_id = options.type_id
    @contacts = options.contacts
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {contacts: @contacts.toJSON(), item_id: @item_id, type_id: @type_id}}))


