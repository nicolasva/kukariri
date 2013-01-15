class App.Collections.Pictures extends Backbone.Collection
  model: App.Picture

  url: ->
    unless _.isUndefined(@item_id)
      "/items/#{@item_id}/types/#{@type_id}/pictures"
    else
      "/pictures"

