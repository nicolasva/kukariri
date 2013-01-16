class App.Collections.ProvidedDates extends Backbone.Collection
  model: App.ProvidedDate

  url: ->
    App.routing({item_id: @item_id, type_id: @type_id, contact_id: @contact_id}, "provided_dates")

