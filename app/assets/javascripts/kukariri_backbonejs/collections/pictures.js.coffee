class App.Collections.Pictures extends Backbone.Collection
  model: App.Picture

  url: ->
    "/items/#{@item_id}/contacts/#{@contact_id}/types/#{@type_id}/pictures"

  add_pictures: (data) ->
    picture_upload = 
       picture_cached_path: data.picture_cached_path
    if @get_master_picture() == null
      picture_upload.is_master = true
    else
      picture_upload.is_master = false
    for picture in @.toArray()
      picture.push(picture_upload)
    @set_master_picture()

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
