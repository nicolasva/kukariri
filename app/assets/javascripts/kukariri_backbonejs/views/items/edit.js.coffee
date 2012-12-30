class App.Views.Items.Edit extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/items/new"]

  id_form_update_edit: "#edit_items" 

  events:
    "submit #edit_items" : "update"
    "click #select_files" : "select_files"
    "click .class_add_contact_item" : "associate_item_contact"

  initialize: (options) ->
    @pictures = options.pictures
    @item = options.item
    @render()
    self = @
    $(".caroussel.other_pictures").children().first().sortable({
      items: '.picture_sort',
      update: ->
        #@item = new App.Item()
        #@item.sort = "sort"
        #@item.save($(this).sortable('serialize'),
        #  success: (sort_item, data) ->
        #    console.log "nicolas"
        #)
        @pictures_all_sort = 
          pictures_all_sort:
            $(this).sortable('toArray')
        @picture = new App.Picture()
        @picture.item_id = self.item.toJSON().id
        @picture.type_id = self.item.toJSON().types[0].id
        @picture.sort = "sort"
        @picture.save(@pictures_all_sort,
          success: (sort_item, data) ->
            console.log "nicolas"
        )
    })

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {item: @item.toJSON(), pictures: @pictures.toJSON()}}))

  select_files: (event) ->
    self = @
    @pictures = new App.Collections.Pictures()
    @pictures.item_id = @item.toJSON().id
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
    event.preventDefault()
    event.stopPropagation()
    @update_location("/items", false)

  associate_item_contact: (event) ->
    @update_location("#/items/#{@item.toJSON().id}/types/#{@item.toJSON().types[0].id}/contacts", true)

  update_location: (location, hash)  ->
    data = $(@id_form_update_edit).toJSON()
    @item.save(data,
      success: (adress, data) ->
        if hash == true
          window.location.hash = location
        else
          window.location = location 
      error: (response) ->
        console.log response
    )
