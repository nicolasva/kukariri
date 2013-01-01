class App.Collections.ProvidedDates extends Backbone.Collection
  model: App.ProvidedDate

  url: ->
    "/items/#{@item_id}/types/#{@type_id}/contacts/#{@contact_id}/provided_dates"

