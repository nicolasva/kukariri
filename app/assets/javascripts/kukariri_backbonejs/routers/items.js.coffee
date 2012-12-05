class App.Routers.Items extends Backbone.Router
  routes:
    "/items/new": "new"
    "/items/:id/edit" : "edit"

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
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"iKz+F8wReBI0lHcgzvZqtyUpjhfDBsSUXAdMtdttE+g=", "panel"=>{"name"=>"Panel name", "categoryall_or_content"=>"1", "onlyconnectuser"=>"0", "categoryalls_attributes"=>{"0"=>{"name"=>"Category name", "choise_category"=>"0", "products_attributes"=>{"0"=>{"title"=>"Product name", "public_price"=>"0.0", "nbr_bidder"=>"0", "titleproducts_attributes"=>{"0"=>{"title"=>"title comentable products", "detail"=>" ", "id"=>"1"}}, "id"=>"1"}}, "content"=>"Enter content text", "linkwebsite"=>"http://", "id"=>"1"}}, "linkwebsite"=>"http://"}, "update_updpanels_1"=>"Update this panel", "id"=>"1"}
    hash_params_create_items = 
      item:
        title: "new title"
    @item.save(hash_params_create_items,{
      success: (item) ->
        hash_params_create_contact = 
          contact:
            lastname: "Lastname"
            firstname: "Firstname"
            email: "<email>@<server>.<com,fr>"
            tel_home: "Home Phone Number"
            tel_mobil: "Mobile Phone Number"
            adress: "Adress"
            country: "Country"

        @contact = new App.Contact()
        @contact.item_id = item.toJSON().id
        @contact.save(hash_params_create_contact,{
          success: (contact) ->
            hash_params_create_type = 
              type:
                descriptif: "Descriptif" 
                item_id: item.toJSON().id
                contact_id: contact.toJSON().id
            @type = new App.Type()
            @type.item_id = item.toJSON().id
            @type.contact_id = contact.toJSON().id
            @type.save(hash_params_create_type, {
              success: (type) ->
                hash_params_create_picture =
                  picture:
                    item_id: item.toJSON().id
                    type_id: type.toJSON().id
                @picture = new App.Picture()
                @picture.item_id = item.toJSON().id
                @picture.contact_id = contact.toJSON().id
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
          error: (contact, response) ->
            alert("Error Create Contact")

        })
      error: (item, response) ->
        alert("Error Create Item")
    })
