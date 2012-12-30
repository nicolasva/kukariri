class App.Views.Pictures.AddPictures extends Backbone.View
  template: JST["kukariri_backbonejs/templates/pictures"]
  el: ".modal"

  #events:
  #  "click .select_files: add_pictures"

  initialize: (options) ->
    @item = options.item
    @pictures = options.pictures
    #@pictures.add_pictures("nicolas")
    #console.log @item.toJSON()
    self = @
    new App.Libs.UploadPicture({
      browse_button: 'select_files',
      container: 'container',
      }, (up, file, data) ->
        self.display_picture(data)
        picture = new App.Picture()
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
        picture.save(@hash_picture,
          error: (picture, data) ->
            alert("Upload error")
        )
      ,"picture"
      ,"#select_files"
    )

  display_picture: (data) ->
    img = "<img src='#{data.url}' alt='#{data.picture_file_name}'>" 
    $(".caroussel.other_pictures ul").append("<li>#{img}</li>")
    $(".caroussel.other_pictures").show()

   
