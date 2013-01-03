class App.Views.Contacts.New extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/new"]

  template_contact_form: JST["kukariri_backbonejs/templates/contacts/_form"]

  template_type_form: JST["kukariri_backbonejs/templates/types/_form"]

  id_form_create: "#new_contact"

  events: 
    "submit #new_contact" : "create"

  initialize: (options) ->
    @item_id = options.item_id
    @type_id = options.type_id
    @types = options.types
    @provided_date = options.provided_date
    @type_selected = options.type_selected
    @contact = options.contact
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {contact: @contact.toJSON()}}))
    $("#provided_date_at").datepicker()
    el_type_form = $('.actions').children().first()
    el_type_form.append(Haml.render(@template_contact_form(), {locals: {contact: @contact.toJSON(), provided_date: @provided_date.toJSON()}}))
    el_type_form.append(Haml.render(@template_type_form(), {locals: {types: @types.toJSON(), type_selected: @type_selected.toJSON(), contact: "", name: "type"}}))


  create: (event) ->
    self = @
    data = $(@id_form_create).toJSON()
    @contact.save(data,
      success: (contact, response_contact) ->
        #console.log "success"
        hash_type = 
          type:
            contact_id: contact.id
            id: data["type"]["id"]
        self.type_selected.save(hash_type,{
          success: (type, response) ->
            date_to = "" unless $("#provided_date_date_to_activation").attr("checked") == true
            hash_provided_date = 
              provided_date:
                date_at: data["provided_date"]["date_at"]
                date_to: date_to
                date_to_activation: data["provided_date"]["date_to_activation"] 
                contact_id: contact.id
                item_id: type.item_id
            self.provided_date.save(hash_provided_date, {
              success: (provided_date, response_provided_date) ->
                window.location.hash = "#/items/"+self.item_id+"/types/"+self.type_id+"/contacts"
              error: (provided_date, response_provided_date) ->
                alert("error")
                console.log provided_date
            })
          error: (type, response) ->
            alert("error")
            console.log type
        })
      error: (contact, data) ->
        alert("error")
        console.log contact
    ) 
    return false
