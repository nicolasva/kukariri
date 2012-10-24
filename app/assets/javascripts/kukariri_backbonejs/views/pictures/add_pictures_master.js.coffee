 class App.Views.Pictures.AddPicturesMaster extends Backbone.View
   el: ".pictures .master img"
   template: JST["kukariri_backbonejs/templates/pictures/add_pictures_master"]

   initialize: (options) ->
     @data = options.data
     @render()

   render: ->
     $(@el).append(Haml.render(@template(),{locals: {data: @data}}))
     
