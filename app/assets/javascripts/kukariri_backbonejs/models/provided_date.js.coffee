class App.ProvidedDate extends Backbone.Model
  url: ->
    base = "/items/#{@item_id}/types/#{@type_id}/contacts/#{@contact_id}/provided_dates"
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
