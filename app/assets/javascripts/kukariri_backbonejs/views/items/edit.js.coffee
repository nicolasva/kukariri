class App.Views.Items.Edit extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/items/new"]

  id_form_update_edit: "#edit_items" 

  events:
    "submit #edit_items" : "update"
    "click .add_pictures" : "add_pictures"

  initialize: (options) ->
    @item = options.item
    @render()

  render: ->
    #console.log @item.toJSON().types[0].contact.adress
    $(@el).html(Haml.render(@template(), {locals: {item: @item.toJSON()}}))

  update: (event) ->
    console.log event
    event.preventDefault()
    event.stopPropagation()
    data = $(@id_form_update_edit).toJSON()
    console.log data
    @item.save(data,
      success: (adress, data) ->
        #console.log adress
        
      error: (response) ->
        console.log response
    )

  add_pictures: (event) ->
    alert("nicolas")
        

