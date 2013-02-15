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
    Regions: {}
    Countries: {}
    Items: {}
    Notifications: {}
    ProvidedDates: {}
    GoogleContactsToContacts: {}
    Pictures: {}
    States: {}
    Types: {}
    Users: {}
    VcfToContacts: {}
    Friends: {}
  Routers: {}
  Libs: {}
  init: ->
    new App.Routers.Items()
    new App.Routers.Contacts()
    new App.Routers.VcfToContacts()
    new App.Routers.GoogleContactsToContacts()
    new App.Routers.Friends()
    Backbone.history.start()
    return

App.routing_yaml = YAML.load('assets/kukariri_backbonejs/routing/routing.yml')
App.routing = (hash = {}, route) ->
  $.each(App.routing_yaml.routing.API, (key, val) ->
    if _.isEqual(key, route)
      route = val
      unless _.isEmpty(hash)
        $.each(hash, (key, val) ->
          route = route.replace(":"+key, val)
        )
      return false
  )

  return route


$(document).ready ->
  App.init()
  return
