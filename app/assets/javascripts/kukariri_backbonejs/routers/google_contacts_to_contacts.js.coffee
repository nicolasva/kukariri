class GoogleContactsToContacts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.google_contacts_to_contacts

  initialize: ->
    @contact = new App.Contact()

  create: ->
    console.log "loading"
