class App.Views.Contacts.New extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/new"]

  id_form_create: "#new_contact"

  events: 
    "submit #new_contact" : "create"

  initialize: (options) ->
    @item_id = options.item_id
    @type_id = options.type_id
    @contact = options.contact
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {}}))

  create: (event) ->
    self = @
    data = $(@id_form_create).toJSON()
    @contact.save(data,
      success: (contact, data) ->
        #console.log "success"
        window.location.hash = "#/items/"+self.item_id+"/types/"+self.type_id+"/contacts"
      error: (contact, data) ->
        console.log "error"
    ) 
    return false
