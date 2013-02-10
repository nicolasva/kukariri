App.Views.Pictures ||= {}
App.Views.Pictures.Photos ||= {} 

class App.Views.Pictures.Photos.Show extends Backbone.View
  el: "#container"
  template: JST["kukariri_backbonejs/templates/pictures/photos/show"]

  events: 
    "click #snap" : "run_cam_to_canvas"
    "click .valid_photo" : "register_bd_img"
  
  initialize: (options) ->
    @photos_to_pictures = options.photos_to_pictures
    @translate = options.translate
    if _.isUndefined(options.item)
      @item = options.item
    @picture = options.picture
    @render()
    self = @
    #Grab elements, create settings, etc.
    @canvas = document.getElementById("canvas")
    @context = @canvas.getContext("2d")
    @video = document.getElementById("video")
    @videoObj = { "video" : true}

    if navigator.getUserMedia
      navigator.getUserMedia(@videoObj, (stream) ->
        self.video.src = stream
        self.video.play()
      )
    else if navigator.webkitGetUserMedia
      navigator.webkitGetUserMedia(@videoObj, (stream) ->
        self.video.src = window.webkitURL.createObjectURL(stream)
        self.video.play()
      )

  render: ->
    $(@el).append(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))

  run_cam_to_canvas: (event) ->
    @context.drawImage(@video, 0, 0, 640, 480)
    $(@el).append("<span class= 'valid_photo btn btn-success'>Valid photo</span>")

  register_bd_img: (event) ->
    self = @
    image = new Image()
    image.src = @canvas.toDataURL("image/png")
    hash_pictures_photo_cam = 
      photos:
        file: @canvas.toDataURL("image/png") 
    @photos_to_pictures.save(hash_pictures_photo_cam, 
      success: (picture, response) ->
        if  _.isUndefined(self.item)
          @hash_picture = 
            picture:
              picture: 
                url: picture.toJSON().url
                current_path: picture.toJSON().url
              cached_path: picture.toJSON().cached_name
        else
          @hash_picture = 
            picture:
              picture: 
                url: "/"+picture.toJSON().url
                current_path: "/"+picture.toJSON().url
              cached_path: picture.toJSON().cached_name
              item_id: self.item.toJSON().id
              type_id: self.item.toJSON().types[0].id

        self.picture.save(@hash_picture,
          success: (response_picture, response) ->
            @viewsPicturesDisplayPictures = new App.Views.Pictures.DisplayPictures({picture: response_picture, translate: self.translate})
          error: (picture, response) ->
            alert("error")
        )

    )
