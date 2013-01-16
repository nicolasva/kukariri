class App.Picture extends Backbone.Model
  defaults:
    picture_file_name: "no_image"

  url: ->
    unless _.isUndefined(@item_id)
      base = App.routing({item_id: @item_id, type_id: @type_id}, "pictures")
    else
      base = App.routing({}, "pictures_bis")
    if @sort
      base + "/" + @sort
    else
      return base if @isNew()
      base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
