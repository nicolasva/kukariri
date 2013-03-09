class App.Collections.Types extends Backbone.Collection
  model: App.Type

  url: ->
    App.routing({login_id: @login_id, item_id: @item_id}, "types")
