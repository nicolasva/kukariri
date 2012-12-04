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
        #self.pictures.add_pictures(data)
        #self.display_picture(data)
        picture = new App.Picture()
        picture.item_id = self.item.toJSON().id
        picture.contact_id = self.item.toJSON().types[0].contact_id
        picture.type_id = self.item.toJSON().types[0].id
        #console.log data.cached_name
        @hash_picture = 
          picture: 
            picture: file.name
            cached_path: data.cached_name
            item_id: self.item.toJSON().id
            type_id: self.item.toJSON().types[0].id
            master: false
        #console.log @hash_picture
        picture.save(@hash_picture,
          success: (picture, data) ->
            console.log(picture.toJSON())
        )
        #picture.set = {url: data.url, cached_path: data.cached_name} 
        #picture.cid = picture.get('cached_path')
        #self.pictures.add picture
        #self.view_pic.unbind() unless self.view_pic == undefined
        #self.view_pic = new App.Views.Pictures.ShowPictures(
        #  el: $('#pictures'),
        #  pictures: self.pictures,
        #  master_picture: self.pictures.get_master_picture()
        #)
      ,"picture"
      ,"#select_files"
    )

  display_picture: (data) ->
    #console.log "nicolas"
    unless $('.pictures .master img').length > 0
      @view_img_master_template = new App.Views.Pictures.AddPicturesMaster({data: data})
    else
      @view_img_variant_pictures = new App.Views.Pictures.OtherImgVariantPictures({data: data})

  add_pictures: (event) ->
    new App.Libs.UploadPicture({  
      browse_button: ""
    }) 

  display_picture: (data) ->
    img = "<img src='#{data.url}' alt='#{data.picture_file_name}'>" 
    if $(".pictures.master img").length < 0
      $(".pictures.master").append(img)
      $(".pictures.master").show()
    else
      $(".caroussel.other_pictures ul").append("<li>#{img}</li>")
      $(".caroussel.other_pictures").show()

   
