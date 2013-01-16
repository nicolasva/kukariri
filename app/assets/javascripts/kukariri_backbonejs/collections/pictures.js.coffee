class App.Collections.Pictures extends Backbone.Collection
  model: App.Picture

  url: ->
    unless _.isUndefined(@item_id)
      App.routing({item_id: @item_id, type_id: @type_id}, "pictures")
    else
      App.routing({}, "pictures_bis")

