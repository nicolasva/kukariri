class App.Item extends Backbone.Model
  defaults:
    title: "Item Title"

  url: ->
    base = "/items"
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
