class App.Libs.UploadPicture extends Backbone.View
  defaults_options:
    runtime: "html5,flash,silverlight"
    max_file_size: "15mb"
    filters: [
      {title: "Image files", extensions: "jpg,jpeg,gif,png"}
    ]
    flash_swf_url: '/assets/plupload.flash.swf'
    silverlight_xap_url: '/assets/plupload.silverlight.xap'
    multipart: true
    url: '/attachments.js'

  initialize: (options, callback, attachment_type = "product_variant_picture", spinner_container) ->
    @callback = callback
    @options = @deepExtend(@options, @defaults_options)
    @uploader = new plupload.Uploader(@options)
    @uploader.init()
    @uploader.bind('FilesAdded', @filesAdded)
    @uploader.bind('FileUploaded', @filesUploaded)
    
  filesAdded: (up, files) ->
    @uploader.start()

  filesUploaded: (up, file, call) ->
    data = $.parseJSON(call.response)
    @callback(up, file, data)

  deepExtend: (object, extenders) ->
    return {} if object?
    for other in extenders
      for own key, val of other
        if not object[key]? and typeof val isnt "object"
          object[key] = val
        else
          object[key] = @deepExtend object[key], val
    return object
