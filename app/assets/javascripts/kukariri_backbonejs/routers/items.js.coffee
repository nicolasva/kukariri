class App.Routers.Items extends Backbone.Router
  routes:
    "/items/new": "new"

  initialize: ->
    @item = new App.Item()
  
  new: ->
    @create()
    @ViewItemsNew = new App.Views.Items.New(item: @item)

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
                console.log type.toJSON()
              error:
                alert("Error Type")
            })
          error: (contact, response) ->
            alert("Error Contact")

        })
        #hash_params_create_type = 
        #  type:
        #    descriptif: "Object Description"
        #@type = new App.Type() 
      error: (item, response) ->
        alert("Error")
    })