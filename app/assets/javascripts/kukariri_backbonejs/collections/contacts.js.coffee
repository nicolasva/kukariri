class App.Collections.Contacts extends Backbone.Collection
  model: App.Contact

  url: ->
    unless _.isUndefined(@item_id)
      App.routing({login_id: @login_id, item_id: @item_id, type_id: @type_id} ,"contacts")
    else
      App.routing({login_id: @login_id}, "contacts_bis")
