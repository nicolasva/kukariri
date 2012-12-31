class App.Views.Contacts.Edit extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/edit"]

  template_type_form: JST["kukariri_backbonejs/templates/types/_form"]

  id_form_edit_contact: "#edit_contact"
  
  events:
    "submit #edit_contact": "update"

  initialize: (options) ->
    @type_selected = options.type_selected
    @types = options.types
    @contact = options.contact
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {contact: @contact.toJSON()}}))
    el_type_form = $('.actions').children().first()
    el_type_form.append(Haml.render(@template_type_form(), {locals: {types: @types.toJSON(), type_selected: @type_selected.toJSON(), contact: @contact.toJSON()}}))

  update: (event) ->
    self = @
    data = $(@id_form_edit_contact).toJSON()
    @contact.save(data,{
      success: (contact, response) ->
        #console.log "success"
        window.location.hash = "#/items/"+self.type_selected.toJSON().item_id+"/types/"+self.type_selected.toJSON().id+"/contacts" 
      error: (contact, response) ->
        alert("Error")
        console.log contact
    })
    return false
    #@contact.save()
