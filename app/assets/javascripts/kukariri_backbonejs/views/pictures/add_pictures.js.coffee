class App.Views.Pictures.AddPictures extends Backbone.View
  initialize: (options) ->
    @translate = options.translate
    @item = options.item unless _.isUndefined(options.item)   
    @pictures = options.pictures
    self = @
    new App.Libs.UploadPicture({
      browse_button: 'select_files',
      container: 'container',
      }, (up, file, data) ->
        picture = new App.Picture()
        unless _.isUndefined(self.item)
          picture.item_id = self.item.toJSON().id
          picture.type_id = self.item.toJSON().types[0].id
          @hash_picture = 
            picture:
              picture:
                url: data.url
                current_path: "/uploads/tmp/#{data.cached_name}"
              cached_path: data.cached_name
              item_id: self.item.toJSON().id
              type_id: self.item.toJSON().types[0].id
        else
          @hash_picture = 
            picture:
              picture:
                url: data.url
                current_path: "/uploads/tmp/#{data.cached_name}"
              cached_path: data.cached_name
        picture.save(@hash_picture,
          success: (response_picture, picture_response) ->
            self.display_picture(response_picture)
          error: (response_picture, picture_response) ->
            alert("Upload error")
        )
      ,"picture"
      ,"#select_files"
    )

  display_picture: (picture) ->
    @viewsPicturesDisplayPictures = new App.Views.Pictures.DisplayPictures({picture: picture, translate: @translate})
