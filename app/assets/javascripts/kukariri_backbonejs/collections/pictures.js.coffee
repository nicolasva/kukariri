class App.Collections.Pictures extends Backbone.Collection
  model: App.Picture

  url: ->
    "/items/#{@item_id}/contacts/#{@contact_id}/types/#{@type_id}/pictures"

  add_pictures: (data) ->
    picture = 
      picture_cached_path: data.picture_cached_path
    if @get_master_picture() == null
      picture["is_master"] = true
    else
      picture["is_master"] = false
    for picture in @.toArray()
      if variant.get('pictures') == 
