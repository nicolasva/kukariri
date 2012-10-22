class App.Views.Pictures.OtherImgVariantPictures extends Backbone.View
  el: '.other_pictures'
  templates: JST["kukariri_backbonejs/templates/pictures/other_img_variant_pictures"]

  templates_init: JST["kukariri_backbonejs/template/pictures/other_img_variant_pictures_init"]

  initialize: (options) ->
    @data = options.data
    @render()

  render: ->
    if $(@el).children().length > 0
      $(@el).children().append(Haml.render(@template(), {locals: {data: @data}}))
    else
      $(@el).html(Haml.render(@templates_init(), {locals: {data: @data}}))
