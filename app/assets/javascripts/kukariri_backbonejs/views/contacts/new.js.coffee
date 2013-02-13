class App.Views.Contacts.New extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/new"]

  template_contact_form: JST["kukariri_backbonejs/templates/contacts/_form"]

  template_type_form: JST["kukariri_backbonejs/templates/types/_form"]

  id_form_create: "#new_contact"

  events: 
    "submit #new_contact" : "create"

  initialize: (options) ->
    @translate = options.translate
    @item_id = options.item_id
    @type_id = options.type_id
    @types = options.types
    @countries = options.countries
    @regions = options.regions
    @provided_date = options.provided_date
    @type_selected = options.type_selected
    @contact = options.contact
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))
    el_contact_form = $('.actions').children().first()
    el_contact_form.append(Haml.render(@template_contact_form(), {locals: {contact: @contact.toJSON(), translate: @translate.toJSON(), page: window.location.hash.split("/")[window.location.hash.split("/").length-1]}}))
    @ViewsCountriesSelectCountriesForm = new App.Views.Countries.SelectCountriesForm({countries: @countries, translate: @translate, regions: @regions})
    @viewProvidedDates = new App.Views.ProvidedDates.Form({provided_date: @provided_date, el: el_contact_form, translate: @translate})
    el_contact_form.append(Haml.render(@template_type_form(), {locals: {types: @types.toJSON(), type_selected: @type_selected.toJSON(), contact: "", name: "type", translate: @translate.toJSON()}}))
    $("#provided_date_at").datepicker()

  create: (event) ->
    self = @
    data = $(@id_form_create).toJSON()
    @contact.save(data,
      success: (contact, response_contact) ->
        hash_type = 
          type:
            contact_id: contact.id
            id: data["type"]["id"]
        self.type_selected.save(hash_type,{
          success: (type, response) ->
            unless $("#provided_date_date_to_activation").attr("value") == true
              date_to = "" 
            else
              date_to = data["provided_date"]["date_to"].split("/").reverse().join("-")
            hash_provided_date = 
              provided_date:
                date_at: data["provided_date"]["date_at"].split("/").reverse().join("-")
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

