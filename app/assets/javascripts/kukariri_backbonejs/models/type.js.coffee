class App.Type extends Backbone.Model
  defaults: 
    descriptif: "descriptif"

  url: ->
    base = App.routing({item_id: @item_id}, "types")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
