class App.Collections.Pictures extends Backbone.Collection
  model: App.Picture

  url: ->
    "/items/#{@item_id}/contacts/#{@contact_id}/types/#{@type_id}/pictures"

  add_pictures: (data) ->
    #picture = 
       #picture_cached_path: data.picture_cached_path
       #if @get_master_picture() == null
       #picture.is_master = true
       #else
       #picture.is_master = false
    #for picture in @.toArray()
    #  if picture.get('pictures') == undefined
    #    unless picture.get("pictures_attributes") != undefined
    #      picture.set("pictures_attributes", [picture])
    #    else
    #      picture.attributes.pictures_attributes.push(picture)
    #  else
    #    picture.attributes.pictures.push(picture)
    #@set_master_picture()

  set_master_picture: ->
    master = null
    if @ != undefined
      for picture in @.toArray()
        if picture.master == true
          unless master == null
            picture.master = false
    return master

  get_master_picture: ->
    master = null
    if @ != undefined
      for picture in @.toArray()
        if picture.master == true
          master = picture.picture_cached_path
    return master
