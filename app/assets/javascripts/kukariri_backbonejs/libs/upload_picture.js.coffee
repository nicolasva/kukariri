class App.Libs.UploadPicture extends Backbone.View
  defaults_options:
    runtimes: "html5,flash,silverlight"
    max_file_size: '15mb'
    filters: [
      {title: "Image files", extensions: "jpg,jpeg,gif,png"}
    ]
    flash_swf_url: '/assets/plupload.flash.swf'
    silverlight_xap_url: '/assets/plupload.silverlight.xap'
    multipart: true
    url: '/attachments.js'

  initialize: (options, callback, attachment_type = "picture", spinner_container) ->
    @callback = callback
    @options = @deepExtend(@options, @defaults_options)
    @options.multipart_params = 
      authenticity_token: $('meta[name=csrf-token]').attr('content'),  
      '_kukariri_session': $('meta[name=session-key-value]').attr('content'),
      attachment_type: attachment_type
    @uploader = new plupload.Uploader(@options)
    @uploader.init()
    @uploader.bind('FilesAdded', @filesAdded)
    @uploader.bind('FileUploaded', @filesUploaded) 

  filesAdded: (up, files) ->
    @uploader.start()

  filesUploaded: (up, file, call) ->
    console.log file
    data = $.parseJSON(call.response)
    @callback(up, file, data)

  deepExtend: (object, extenders...) ->
    return {} if not object?
    for other in extenders
      for own key, val of other
        if not object[key]? and $.isArray(val)
          object[key] = val
        else if not object[key]? and typeof val isnt "object"
          object[key] = val
        else
          object[key] = @deepExtend object[key], val
    object
