class App.Routers.VcfToContacts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.vcf_to_contacts.routes

  initialize: ->
    @translate = new App.Translate()

  create: ->
    self = @
    @translate.fetch
      success: () ->
        @viewVcfToContacts = new App.Views.VcfToContacts.VcfToContacts({translate: self.translate.toJSON()})

