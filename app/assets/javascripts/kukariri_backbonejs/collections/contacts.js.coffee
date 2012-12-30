class App.Collections.Contacts extends Backbone.Collection
  model: App.Contact

  url: ->
    "/items/#{@item_id}/types/#{@type_id}/contacts"
