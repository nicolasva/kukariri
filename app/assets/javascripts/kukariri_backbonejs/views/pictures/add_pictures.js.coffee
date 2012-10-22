class App.Views.Pictures.AddPictures extends Backbone.View
  template: JST["kukariri_backbonejs/templates/pictures"]
  el: ".modal"

  #events:
  #  "click .select_files: add_pictures"

  initialize: (options) ->
    @item = options.item
    @pictures = options.pictures
    #@pictures.add_pictures("nicolas")
    #console.log @item.toJSON()
    self = @
    new App.Libs.UploadPicture({
      browse_button: 'select_files',
      container: 'container',
    }, (up, file, data) ->
      self.pictures.add_pictures(data)
      self.display_picture(data)

  display_picture: (data) ->
    #console.log "nicolas"
    unless $('.pictures .master img').length > 0
      @view_img_master_template = new App.Views.Pictures.AddPicturesMaster({data: data})
    else
      @view_img_variant_pictures = new App.Views.Pictures.OtherImgVariantPictures({data: data})

  filesAdded: (up, files) ->
    @uploader.start()
  
  fileUploaded: (up, file, call) ->
    console.log "nicolas"
    #@uploader

  add_pictures: (event) ->
    new App.Libs.UploadPicture({  
      browse_button: ""
    }) 

  display_picture: (data) ->

