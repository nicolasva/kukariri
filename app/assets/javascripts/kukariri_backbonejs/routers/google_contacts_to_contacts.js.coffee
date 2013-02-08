class App.Routers.GoogleContactsToContacts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.google_contacts_to_contacts.routes

  initialize: ->
    @translate = new App.Translate()
    @googleContactsToContact = new App.GoogleContactsToContact()
    @contact = new App.Contact()

  create: ->
    self = @
    @contact.translate = @translate.toJSON()
    @googleContactsToContact.translate = @translate.toJSON()
    @contact.fetch
      success: (model, response) ->
        self.translate.fetch
          success: () ->
            @viewsGoogleContactsToContacts = new App.Views.GoogleContactsToContacts.Create({contact: model, googleContactsToContact: self.googleContactsToContact, translate: self.translate})
