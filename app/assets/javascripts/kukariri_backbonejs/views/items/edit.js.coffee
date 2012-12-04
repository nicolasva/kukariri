class App.Views.Items.Edit extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/items/new"]

  id_form_update_edit: "#edit_items" 

  events:
    "submit #edit_items" : "update"
    "click .add_pictures" : "add_pictures"
    "click #select_files" : "select_files"

  initialize: (options) ->
    @item = options.item
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {item: @item.toJSON()}}))

  select_files: (event) ->
    self = @
    @pictures = new App.Collections.Pictures()
    @pictures.item_id = @item.toJSON().id
    @pictures.contact_id = @item.toJSON().types[0].contact_id
    console.log @item.toJSON().types[0].id 
    @pictures.type_id = @item.toJSON().types[0].id
    @pictures.fetch
      success: (collection, response) ->
        @viewAddPictures = new App.Views.Pictures.AddPictures({item: self.item, pictures: collection})
  
  init_uploader: ->
    @uploader = new plupload.Uploader({
      runtimes: 'gears,html5,flash,silverlight,browserplus',
      browse_button: 'pickfiles',
      container: '.container',
      max_file_size: '10mb',
      url: '/attachments.js',
      flash_swf_url: '/assets/plupload.flash.swf'
      silverlight_xap_url: '/assets/plupload.silverlight.xap'
      multipart: true
      filters: [
        {title : "Image files", extensions : "JPG,JPEG,jpeg,jpg,gif,png"}
      ]

    })

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
        

