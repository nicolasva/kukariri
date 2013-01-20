class App.Routers.Items extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.items.routes

  initialize: ->
    @translate = new App.Translate()
    @libsLinkNewContact = new App.Libs.LinkNewContact()
    @item = new App.Item()
    @type = new App.Type()
    @picture = new App.Picture()
    @photos_to_pictures = new App.PhotosToPictures()

  new_item: ->
    self = @
    @translate.fetch
      success: () ->
        self.picture.fetch
          success: (model, response) ->
            @viewItemsNew = new App.Views.Items.New({translate: self.translate, item: self.item, type: self.type, photos_to_pictures: self.photos_to_pictures, picture: model})

  edit: (id) ->
    self = @
    @item = new App.Item(id: id)
    @pictures = new App.Collections.Pictures()
    @pictures.item_id = id
    @pictures.contact_id = 1
    @pictures.type_id = 1
    @translate.fetch
      success: () ->
        self.item.fetch
          success: (model, response) ->
            self.pictures.fetch
              success: (collection, response) ->
                @ViewsItemsEdit = new App.Views.Items.Edit(item: model, pictures: collection, translate: self.translate)

  destroy: (id) ->
    @item = new App.Item(id: id)
    @item.destroy ->
      success: (item, response) ->
        window.location = "/items" 
    return false
