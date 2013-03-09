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

  new_item: (login_id) ->
    self = @
    self.item.login_id = login_id
    @translate.fetch
      success: () ->
        self.picture.login_id = login_id
        self.picture.fetch
          success: (model, response) ->
            @viewItemsNew = new App.Views.Items.New({translate: self.translate, login_id: login_id, item: self.item, photos_to_pictures: self.photos_to_pictures, picture: model})

  edit: (login_id, id) ->
    self = @
    @item = new App.Item(id: id)
    @item.email = email
    @pictures = new App.Collections.Pictures()
    @pictures.login_id = login_id
    @pictures.item_id = id
    @pictures.contact_id = 1
    @pictures.type_id = 1
    @translate.fetch
      success: () ->
        self.item.fetch
          success: (model, response) ->
            self.pictures.fetch
              success: (collection, response) ->
                @ViewsItemsEdit = new App.Views.Items.Edit(item: model, login_id: self.login_id, pictures: collection, translate: self.translate)
