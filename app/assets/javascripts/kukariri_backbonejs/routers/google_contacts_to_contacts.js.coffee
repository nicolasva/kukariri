class App.Routers.GoogleContactsToContacts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.google_contacts_to_contacts.routes

  initialize: ->
    @contact = new App.Contact()

  create: ->
    console.log "loading"
    @contact.fetch
      success: (model, response) ->
        @viewsGoogleContactsToContacts = new App.Views.GoogleContactsToContacts.Create({contact: model})
