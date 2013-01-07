class App.ProvidedDate extends Backbone.Model
  defaults:
    date_at: new Date().getFullYear()+"/"+ new Date().getMonth() + 1 + "/" + new Date().getDate()
    date_to: new Date().getFullYear()+"/"+ new Date().getMonth() + 1 + "/" + new Date().getDate() + 5
    date_to_activation: false

  url: ->
    base = "/items/#{@item_id}/types/#{@type_id}/contacts/#{@contact_id}/provided_dates"
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
