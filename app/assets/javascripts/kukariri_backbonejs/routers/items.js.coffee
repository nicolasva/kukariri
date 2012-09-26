class App.Routers.Items extends Backbone.Router
  routes:
    "/items/new": "new"

  new: ->
    @item = new App.Item()
    @ViewItemsNew = new App.Views.Items.New(item: @item)
