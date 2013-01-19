App.Views.Pictures ||= {}
App.Views.Pictures.Photos ||= {} 

class App.Views.Pictures.Photos.Show extends Backbone.View
  el: "#container"
  template: JST["kukariri_backbonejs/templates/pictures/photos/show"]

  events: 
    "click #snap" : "run_cam_to_canvas"
  
  initialize: (options) ->
    @translate = options.translate
    @render()
    self = @
    #Grab elements, create settings, etc.
    @canvas = document.getElementById("canvas")
    @context = @canvas.getContext("2d")
    @video = document.getElementById("video")
    @videoObj = { "video" : true}
    errBack = (error) ->
      console.log("Video capture error: ", error.code)


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
