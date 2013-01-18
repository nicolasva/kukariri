App.Views.Pictures ||= {}
App.Views.Pictures.Photos ||= {} 

class App.Views.Pictures.Photos.Show extends Backbone.View
  el: "#container"
  template: JST["mobile/templates/pictures/photos/show"]

  events: 
    "click #snap" : "run_cam_to_canvas"
  initialize: (options) ->
    self = @
    #Grab elements, create settings, etc.
    @canvas = $("#canvas")
    @translate = options.translate
    @context = @canvas.getContext("2d")
    @video = $("#video")
    @videoObj = { "video" : true}
    errBack = (error) ->
      console.log("Video capture error: ", error.code)


    if navigator.getUserMedia
      navigator.getUserMedia(videoObj, (stream) ->
        self.video.src = stream
        self.video.play()
      )
    else if navigator.webkitGetUserMedia
      navigator.webkitGetUserMedia(videoObj, (stream) ->
        self.video.src = window.webkitURL.createObjectURL(stream)
        self.video.play()
      )
    @render()

  render: ->
    $(@el).append(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))

  run_can_to_canvas: (event) ->
    @context.drawImage(@video, 0, 0, 640, 480)
