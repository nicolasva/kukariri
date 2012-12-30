class App.Collections.Types extends Backbone.Collection
  model: App.Type

  url: ->
    "/items/#{@item_id}/types"
