class App.Views.GoogleContactsToContacts.Create extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/create"]
  id_form_gmail: "#id_form_gmail" 

  events:
    "submit #id_form_gmail" : "create"

  initialize: (options) ->
    @valid_export_contact = true
    @translate = options.translate
    @contact = options.contact
    @googleContactsToContact = options.googleContactsToContact
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))

  create: (event) ->
    self = @
    @contact.translate = @translate.toJSON()
    data = $(@id_form_gmail).toJSON()
    @googleContactsToContact.save(data,
      success: (google_contacts_to_contact_response, response_contacts_to_contact_response) ->
        $.each(google_contacts_to_contact_response.toJSON(), (key, val) ->
          unless _.isUndefined(val.name)
            if val.name == ""
              lastname = "name"
            else
              lastname = val.name

            if val.tel == "phone_number"
              tel_home = ""
            else
              tel_home = val.tel

            if val.other_tel == "phone_number"
              tel_mobil = ""
            else
              tel_mobil = val.other_tel

            if val.address == "postal_address"
              address = ""
            else
              address = val.address
            hash_contact = 
              contact:
                lastname: lastname
                firstname: lastname
                email: val.email
                tel_home: tel_home 
                tel_mobil: tel_mobil
                adress: address 
                country: "France"
            self.contact.save(hash_contact,
              error: (contact_response, response_contact) ->
                self.valid_export_contact = false
            )
        )
      error: (google_contacts_to_contact_response, response_contacts_to_contact_response) ->
        alert("Google contacts to contact response")
    )
    window.location.hash = "#/contacts" if self.valid_export_contact
    return false
