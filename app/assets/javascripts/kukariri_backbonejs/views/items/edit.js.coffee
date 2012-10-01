class App.Views.Items.Edit extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/items/new"]

  id_form_update_edit: "#edit_items" 

  events:
    "submit #edit_items" : "update"

  initialize: (options) ->
    @item = options.item
    @render()

  render: ->
    #console.log @item.toJSON().types[0].contact.adress
    $(@el).html(Haml.render(@template(), {locals: {item: @item.toJSON()}}))

  update: (event) ->
    event.preventDefault()
    event.stopPropagation()
    data = $(@id_form_update_edit).toJSON()
    #console.log data
    #console.log data.item.types_attributes[0]
    #hash_data_form = 
    #  item:
    #    title: data.item.title
    #    id: data.item.id
    #    created_at: data.item.created_at 
    #    updated_at: data.item.updated_at
    #    user_id: ""
    #    types_attributes:
    #      "0":
    #        date_to: data.item.types_attributes[0].date_to
    #        date_at: data.item.types_attributes[0].date_at
    #        descriptif: data.item.types_attributes[0].descriptif
    #        contacts:
    #          lastname: data.item.types_attributes[0].contacts.lastname
    #          firstname: data.item.types_attributes[0].contacts.firstname
    #          email: data.item.types_attributes[0].contacts.email
    #          tel_home: data.item.types_attributes[0].contacts.tel_home
    #          tel_mobil: data.item.types_attributes[0].contacts.tel_mobil
    #console.log hash_data_form
    #not correct
    #{"title"=>"new title", "id"=>"49", "created_at"=>"2012-09-30T11:38:00Z", "updated_at"=>"2012-09-30T11:38:00Z", "user_id"=>nil, 
    #"types"=>
    #[{"contact_id"=>43, "created_at"=>"2012-09-30T11:38:00Z", "date_at"=>nil, "date_to"=>nil, "descriptif"=>"Descriptif", "id"=>37, "item_id"=>49, "updated_at"=>"2012-09-30T11:38:00Z", "pictures"=>[{"created_at"=>"2012-09-30T11:38:00Z", "id"=>32, "item_id"=>49, "picture_content_type"=>nil, "picture_file_name"=>nil, "picture_file_size"=>nil, "picture_updated_at"=>nil, "type_id"=>37, "updated_at"=>"2012-09-30T11:38:00Z"}], "contact"=>{"adress"=>"Adress", "country"=>"Country", "created_at"=>"2012-09-30T11:38:00Z", "email"=>"<email>@<server>.<com,fr>", "firstname"=>"Firstname", "id"=>43, "lastname"=>"Lastname", "tel_home"=>"Home Phone Number", "tel_mobil"=>"Mobile Phone Number", "updated_at"=>"2012-09-30T11:38:00Z"}}], "item"=>{"title"=>"new title", "types_attributes"=>[{"date_to"=>"null", "descriptif"=>"Descriptif"}]}}
    
    #correctly
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"iKz+F8wReBI0lHcgzvZqtyUpjhfDBsSUXAdMtdttE+g=", "categoryall"=>
    #{"panels"=>
    #{"name"=>"Panel name", "categoryall_or_content"=>"1", "onlyconnectuser"=>"0", "linkwebsite"=>"http://"}, "name"=>"Category name", "choise_category"=>"0", 
    #"products_attributes"=>
    #{"0"=>
    #{"title"=>"Product name", "public_price"=>"0.0", "nbr_bidder"=>"0", "id"=>"1"}}, 
    #"content"=>"Enter content text", "linkwebsite"=>"http://"}, "update_updcategoryalls_1"=>"Update this panel", "id"=>"1"}
    @item.save(data,
      success: (adress, data) ->
        console.log adress
      error: (response) ->
        console.log response
    )
        

