class App.Collections.Contacts extends Backbone.Collection
  model: App.Contact

  url: ->
    unless _.isUndefined(@item_id)
      App.routing({item_id: @item_id, type_id: @type_id} ,"contacts")
    else
      App.routing({}, "contacts_bis")
