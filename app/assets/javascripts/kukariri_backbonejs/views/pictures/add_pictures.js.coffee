class App.Views.Pictures.AddPictures extends Backbone.View
  template: JST["kukariri_backbonejs/templates/pictures"]
  el: ".modal"

  #events:
  #  "click .select_files: add_pictures"

  initialize: (options) ->
    @item: options.item
    new App.Libs.UploadPicture({
      browse_button: 'select_files',
      container: 'container',
      
    }, (up, file, data) ->


  filesAdded: (up, files) ->
    @uploader.start()
  
  fileUploaded: (up, file, call) ->
    console.log "nicolas"
    #@uploader

  add_pictures: (event) ->
    new App.Libs.UploadPicture({  
      browse_button: ""
    }) 
