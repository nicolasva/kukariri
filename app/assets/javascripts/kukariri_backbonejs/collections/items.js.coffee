class App.Collections.Items extends Backbone.Collection
  model: App.Item

  url: ->
    "/items"
