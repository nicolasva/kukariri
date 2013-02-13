class App.Collections.Regions extends Backbone.Collection
  url: ->
    App.routing({country_name: @country_name}, "regions")
