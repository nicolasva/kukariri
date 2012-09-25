class App.Routers.Items extends Backbone.Router
  routes:
    "/items/new": "new"

  initialize: ->
    console.log "items"

  new: ->
    alert("nicolas")
    #@item = new App.Item()
    #@ViewItemsNew = new App.Views.Items.New(item: @item)
