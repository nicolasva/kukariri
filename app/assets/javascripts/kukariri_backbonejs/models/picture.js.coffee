class App.Picture extends Backbone.Model
  defaults:
    picture_file_name: "no_image"

  url: ->
    base = "/items/#{@item_id}/types/#{@type_id}/pictures"
    if @sort
      base + "/" + @sort
    else
      return base if @isNew()
      base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
