class App.Views.Pictures.AddPictures extends Backbone.View
  template: JST["kukariri_backbonejs/templates/pictures"]
  el: ".modal"

  initialize: (options) ->


  init_uploader:  
    runtimes: 'gears,html5,flash,silverlight,browserplus',
    browse_button: 'pickfiles',
    container: '.container',
    max_file_size: '10mb',
    url: '/attachments.js',
    flash_swf_url: '/assets/plupload.flash.swf'
    silverlight_xap_url: '/assets/plupload.silverlight.xap'
    multipart: true
    multipart_params: 
      attachment_type: "picture"
    filters: [
      {title : "Image files", extensions : "JPG,JPEG,jpeg,jpg,gif,png"}
    ]

  initialize: (options) ->
    @uploader = new plupload.Uploader(@init_uploader)
    @uploader.init()
    @uploader.bind('FilesAdded', @filesAdded)
    @uploader.bind('FileUploaded', @fileUploaded)
    
  filesAdded: (up, files) ->
    @uploader.start()
  
  fileUploaded: (up, file, call) ->
    console.log "nicolas"
    #@uploader
