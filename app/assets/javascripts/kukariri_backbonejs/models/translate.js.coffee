class App.Translate extends Backbone.Model
  url: ->
    App.routing({}, "translates")
