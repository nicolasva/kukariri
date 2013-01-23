class App.Views.Items.New extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/items/new"]

  id_form_update_edit: "#edit_items" 

  events:
    "submit #edit_items" : "create"
    "click #select_files" : "select_files"
    "click #cam_active" : "use_cam"
    "click .class_add_contact_item" : "associate_item_contact"

  initialize: (options) ->
    @item = options.item
    @type = options.type
    @translate = options.translate
    @photos_to_pictures = options.photos_to_pictures
    @picture = options.picture
    @render()
    $(".caroussel.other_pictures").children().first().sortable({
      items: '.picture_sort',
      update: ->
        @pictures_all_sort = 
          pictures_all_sort:
            $(this).sortable('toArray')
        @picture = new App.Picture()
        @picture.sort = "sort"
        @picture.save(@pictures_all_sort,
          success: (sort_item, data) ->
            console.log "nicolas"
        )
    })

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {name_type: "item[type][descriptif]", translate: @translate.toJSON(), page: window.location.hash.split("/")[window.location.hash.split("/").length-1]}}))

  use_cam: (event) ->
    #alert("nicolas")
    @ViewsPicturesPhotoShow = new App.Views.Pictures.Photos.Show({translate: @translate, photos_to_pictures: @photos_to_pictures, picture: @picture})

  select_files: (event) ->
    self = @
    @pictures = new App.Collections.Pictures()
    @translate.fetch
      success: () ->
        self.pictures.fetch
          success: (collection, response) ->
            @viewAddPictures = new App.Views.Pictures.AddPictures({pictures: collection, translate: self.translate})

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

  create: (event) -> 
    @create_location(false)

  associate_item_contact: (event) ->
    @create_location(true)

  create_location: (hash)  ->
    self = @
    data = $(@id_form_update_edit).toJSON()
    tab_picture = new Array()
    $(".ui-sortable").children().each (key,value) ->
      tab_picture.push($(value).attr("id").split("_")[$(value).attr("id").split("_").length-1])
    if _.isEmpty(tab_picture)
      hash_data_picture =
        item:
          data.item
        type:
          data.type
    else
      hash_data_picture =
        item:
          data.item
        type:
          data.type
        picture:
          tab_picture


    @item.save(hash_data_picture,
      success: (item_response, response_item) ->
        console.log "nicolas"
      error: (item_response, response_item) ->
        alert("error")
    )
    return false

        #@item.save(data,
        #success: (item, response) ->
        #self.type.item_id = item.id
        #self.type.save(data,
        #  success: (type, response) ->
        #    nb_picture = $(".ui-sortable").children().length
        #    $(".ui-sortable").children().each (key,value) ->
        #      picture_id = $(value).attr("id").split("_")[$(value).attr("id").split("_").length-1]
        #      @picture = new App.Picture()
        #      @picture.id = picture_id
        #      hash_picture = 
        #        picture:
        #          item_id: item.id
        #          type_id: type.id
        #      @picture.save(hash_picture, {
                #success: (picture, response) ->
                #  console.log self.cpt
                #  self.cpt = self.cpt + 1
                #   value = true
                #  console.log "success picture"
                #       error: (picture, response) -> 
                #  console.log "error picture"
                #})
                #if hash == true 
                #window.location.hash = "#/items/#{item.id}/types/#{type.id}/contacts"
                #else
                #window.location = "/items"
                #error: (type, response) ->
                #alert("Error")
                #console.log(type)
                #)
                #error: (response) ->
                #console.log response
        #)
