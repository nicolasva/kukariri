class App.PhotosToPictures extends Backbone.Model
  url: ->
    base = App.routing({}, "photos_to_pictures")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    @errors = []
    if attributes.photos?
      @errors.push "Photo File can't be empty" unless attributes.photos.file? and attributes.photos.file isnt ""
    else
      @errors.push "Photo File can't be empty" unless attributes.file? and attributes.file isnt ""
