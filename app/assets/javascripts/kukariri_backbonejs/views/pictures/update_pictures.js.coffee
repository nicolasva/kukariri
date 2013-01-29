class App.Views.Pictures.UpdatePictures extends Backbone.View
  initialize: (options) ->
    @translate = options.translate
    @item = options.item
    @pictures = options.pictures
    self = @
    new App.Libs.UploadPicture({
      browse_button: 'picture_update',
      container: 'container'
      }, (up, file, data) ->
        picture = new App.Picture()

    )
