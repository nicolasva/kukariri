#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./libs
#= require_tree ./routers

@App = 
  Models: {}
  Collections: {}
  Views: {} =
    Contacts: {}
    Countries: {}
    Items: {}
    Notifications: {}
    ProvidedDates: {}
    Pictures: {}
    States: {}
    Types: {}
    Users: {}
  Routers: {}
  Libs: {}
  init: ->
    new App.Routers.Items()
    new App.Routers.Contacts()
    Backbone.history.start()
    return

$(document).ready ->
  App.init()
  return
