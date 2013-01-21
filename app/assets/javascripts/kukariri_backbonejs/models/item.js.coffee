class App.Item extends Backbone.Model
  defaults:
    title: "Item Title"

  url: ->
    base = App.routing({}, "items")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    #"Error!" unless attributes
    @errors = []
    if attributes.item?
      @errors.push "Title can't be empty" unless attributes.item.title? and attributes.item.title isnt ""
    else
      @errors.push "Title can't be empty" unless attributes.title? and attributes.title isnt ""
