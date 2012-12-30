class App.Collections.Pictures extends Backbone.Collection
  model: App.Picture

  url: ->
    "/items/#{@item_id}/types/#{@type_id}/pictures"

