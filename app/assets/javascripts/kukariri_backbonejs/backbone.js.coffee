#= require_self
#= require_tree ./templates
#= require_tree ./common/common_templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./common/common_views
#= require_tree ./libs
#= require_tree ./routers

@App = 
  Models: {}
  Collections: {}
  Common: {} =
    CommonViews: {} =
      Notice: {}
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

App.routing_yaml = YAML.load('assets/kukariri_backbonejs/routing/routing.yml')
App.routing = (hash = {}, route) ->
  #hash = {"item_id": 1}
  #console.log routing_yaml.routing
  route_val = ""
  $.each(App.routing_yaml.routing.API, (key, val) ->
    if key == route
      route_val = val 
  )

  if _.isEmpty(hash)
    return route_val
  else
    $.each(hash, (key, val) ->
      route_val = route_val.replace(":"+key, val)
    )
    return route_val

App.routing_backbone = (route) ->
  route_val = ""
  $.each(App.routing_yaml.routing_backbone.API, (key, val) ->
    if key == route
      route_val = val 
  )
  return route_val


$(document).ready ->
  App.init()
  return
