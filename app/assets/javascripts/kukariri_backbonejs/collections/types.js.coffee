class App.Collections.Types extends Backbone.Collection
  model: App.Type

  url: ->
    App.routing({item_id: @item_id}, "types")
