class App.Views.Pictures.UpdatePictures extends Backbone.View
  initialize: (options) ->
    @translate = options.translate
    @item = options.item
    @pictures = options.pictures
    @picture_id = options.picture_id
    self = @
    new App.Libs.UploadPicture({
      browse_button: 'picture_update',
      container: 'container'
      }, (up, file, data) ->
        picture = new App.Picture()
        picture.item_id = self.item.toJSON().id
        picture.type_id = self.item.toJSON().types[0].id
        picture.id = self.picture_id
        @hash_picture =
          id: self.picture_id
          picture:
            picture:
              url: data.url
              current_path: "/uploads/tmp/#{data.cached_name}"
            cached_path: data.cached_name
            item_id: self.item.toJSON().id
            type_id: self.item.toJSON().types[0].id
        picture.save(@hash_picture,
          success: (response_picture, picture_response) ->
            @viewsPicturesDisplayPictures = new App.Views.Pictures.DisplayPictures({picture: response_picture, translate: self.translate})
          error: (response_picture, picture_response) ->
            alert("Upload Error")
        )
      ,"picture"
      ,".picture_update"
    )
