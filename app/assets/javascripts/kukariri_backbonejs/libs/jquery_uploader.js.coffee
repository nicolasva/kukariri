class App.Libs.JqueryUploader extends Backbone.View
  initialize: (options) ->
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
        console.log response
        self.callback.push(response)
        return false
    })
    return @callback
