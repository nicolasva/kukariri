class App.Routers.Items extends Backbone.Router
  routes:
    "/items/new": "new"

  new: ->
    #@create()
    @item = new App.Item()
    @ViewItemsNew = new App.Views.Items.New(item: @item)

  create: ->
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"iKz+F8wReBI0lHcgzvZqtyUpjhfDBsSUXAdMtdttE+g=", "panel"=>{"name"=>"Panel name", "categoryall_or_content"=>"1", "onlyconnectuser"=>"0", "categoryalls_attributes"=>{"0"=>{"name"=>"Category name", "choise_category"=>"0", "products_attributes"=>{"0"=>{"title"=>"Product name", "public_price"=>"0.0", "nbr_bidder"=>"0", "titleproducts_attributes"=>{"0"=>{"title"=>"title comentable products", "detail"=>" ", "id"=>"1"}}, "id"=>"1"}}, "content"=>"Enter content text", "linkwebsite"=>"http://", "id"=>"1"}}, "linkwebsite"=>"http://"}, "update_updpanels_1"=>"Update this panel", "id"=>"1"}
    hash_params_create = 
      item:
        title: "new title"
        pictures_attributes:
          0:
            picture: ""
            types_attributes: 
              0:
                descripitf: "descripitf"


