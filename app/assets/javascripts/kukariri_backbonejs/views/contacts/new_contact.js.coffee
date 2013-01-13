class App.Views.Contacts.NewContact extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/new"]

  template_contact_form: JST["kukariri_backbonejs/templates/contacts/_form"]

  id_form_create: "#new_contact"

  events: 
    "submit #new_contact": "create"

  initialize: (options) ->
    @translate = options.translate
    @contact = options.contact
    @contact.translate = @translate.toJSON()
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))
    el_contact_form = $('.actions').children().first()
    el_contact_form.append(Haml.render(@template_contact_form(), {locals: {contact: @contact.toJSON(), translate: @translate.toJSON()}}))

  create: (event) ->
    data = $(@id_form_create).toJSON()
    @contact.save(data,
      success: (contact, response_contact) ->
        window.location = "/items"
      error: (contact_response_error, response_contact_error) ->
        #alert("Error")
        new App.Common.CommonViews.Notice.Notice({response_errors: contact_response_error.errors})
    )
    return false


