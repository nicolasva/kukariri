class App.Views.Pictures.DisplayPictures extends Backbone.View
  template: JST["kukariri_backbonejs/templates/pictures/pictures"]
  el: ".caroussel.other_pictures ul"

  initialize: (options) ->
    @picture = options.picture
    @translate = options.translate
    @render()

  render: ->
    console.log @picture.toJSON().picture.url
    #console.log @translate.toJSON()
    $(@el).html(Haml.render(@template(), {locals: {picture: @picture.toJSON(), translate: @translate.toJSON()}}))
    $(@el).show()
