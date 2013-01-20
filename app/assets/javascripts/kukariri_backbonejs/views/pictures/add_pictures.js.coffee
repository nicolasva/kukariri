class App.Views.Pictures.AddPictures extends Backbone.View
  template: JST["kukariri_backbonejs/templates/pictures/pictures"]
  el: ".caroussel.other_pictures ul" 

  initialize: (options) ->
    @translate = options.translate
    if _.isUndefined(options.item)
      @item = options.item
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
          success: (picture, response) ->
            self.display_picture(picture.id, data)
          error: (picture, response) ->
            alert("Upload error")
        )
      ,"picture"
      ,"#select_files"
    )

  display_picture: (picture_id, data) ->
    $(@el).html(Haml.render(@template(), {locals: {picture: data, picture_id: picture_id, translate: @translate.toJSON()}}))
    $(@el).show() 
