class App.Collections.Countries extends Backbone.Collection
  model: App.Country

  url: ->
    App.routing({}, "countries")
