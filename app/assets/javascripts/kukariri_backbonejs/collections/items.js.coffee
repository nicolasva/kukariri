class App.Collections.Items extends Backbone.Collection
  model: App.Item

  url: ->
    App.routing({},"items")
