class App.Libs.JqueryUploader extends Backbone.View
  initialize:(options)
    @callback = new Array()
    @el = options.el
    @fileTypes = options.fileTypes
    @uploader()

  uploader: ->
    self = @
    $(@el).fileupload({
      dataType: 'json',
      url: '/attachments.js'
      done: (data, response) ->
        self.callback.push(response)
      process: [
        {
          action: 'load',
          fileTypes: self.fileTypes,
          maxFileSize: 80000000
        },
        {
          action: 'resize',
          maxWidth: 300,
          maxHeight: 300
        },
        {
          action: 'save'
        }
      ]
    })
    return @callback
