class App.Collections.Items extends Backbone.Collection
  model: App.Item

  url: ->
    App.routing({login_id: @login_id, email: @email},"items")
