class App.Collections.Contacts extends Backbone.Collection
  model: App.Contact

  url: ->
    unless _.isUndefined(@item_id)
      "/items/#{@item_id}/types/#{@type_id}/contacts"
    else
      "/contacts"
