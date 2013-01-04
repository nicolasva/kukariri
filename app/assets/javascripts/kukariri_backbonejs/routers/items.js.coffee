class App.Routers.Items extends Backbone.Router
  routes:
    "/items/new": "new"
    "/items/:id/edit" : "edit"
    "/items/:id" : "destroy"

  initialize: ->
    @item = new App.Item()
  
  new: ->
    @create()

  edit: (id) ->
    self = @
    @item = new App.Item(id: id)
    @pictures = new App.Collections.Pictures()
    @pictures.item_id = id
    @pictures.contact_id = 1
    @pictures.type_id = 1
    @item.fetch
      success: (model, response) ->
        self.pictures.fetch
          success: (collection, response) ->
            @ViewsItemsEdit = new App.Views.Items.Edit(item: model, pictures: collection)

  create: ->
    self = @
    hash_params_create_items = 
      item:
        title: "new title"
    @item.save(hash_params_create_items,{
      success: (item) ->
        hash_params_create_type = 
          type:
            descriptif: "Descriptif" 
            item_id: item.toJSON().id
            contact_id: null
        @type = new App.Type()
        @type.item_id = item.toJSON().id
        @type.save(hash_params_create_type, {
          success: (type) ->
            hash_params_create_picture =
              picture:
                item_id: item.toJSON().id
                type_id: type.toJSON().id
            @picture = new App.Picture()
            @picture.item_id = item.toJSON().id
            @picture.type_id = type.toJSON().id
            @picture.save(hash_params_create_picture, {
              success: (picture) ->
                window.location.hash = "#/items/#{item.toJSON().id}/edit"
              error: (picture, response) ->
                alert("Error  Create Picture")
            })
          error: (type, response) ->
            alert("Error Create Type")
        })
      error: (item, response) ->
        alert("Error Create Item")
    })

  destroy: (id) ->
    @item = new App.Item(id: id)
    @item.destroy ->
      success: (item, response) ->
        window.location = "/items" 
    return false
