class App.Collections.Friends extends Backbone.Collection
  model: App.Friend

  url: ->
    App.routing({},"friends")
