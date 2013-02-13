class App.Views.Contacts.Edit extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/edit"]

  template_contact_form: JST["kukariri_backbonejs/templates/contacts/_form"]

  template_type_form: JST["kukariri_backbonejs/templates/types/_form"]

  id_form_edit_contact: "#edit_contact"
  
  events:
    "submit #edit_contact": "update"

  initialize: (options) ->
    unless _.isUndefined(options.provided_date)
      @provided_date = options.provided_date
      @type_selected = options.type_selected
      @types = options.types
    @countries = options.countries
    @translate = options.translate
    @regions = options.regions
    @contact = options.contact
    @render()

  render: ->
    self = @
    $(@el).html(Haml.render(@template(), {locals: {translate: @translate.toJSON()}}))
    el_contact_form = $('.actions').children().first()
    el_contact_form.append(Haml.render(@template_contact_form(), {locals: {contact: @contact.toJSON(), translate: @translate.toJSON(), page: window.location.hash.split("/")[window.location.hash.split("/").length-1]}})) 
    @ViewsCountriesSelectCountriesForm = new App.Views.Countries.SelectCountriesForm({countries: @countries, translate: @translate, regions: @regions})
    @regions.country_name = @contact.toJSON().country
    @regions.fetch
      success: (collection, response) ->
        @ViewsRegionsIndex = new App.Views.Regions.Index({regions: collection, translate: self.translate, contact: self.contact})
    unless _.isUndefined(@provided_date)
      @viewProvidedDates = new App.Views.ProvidedDates.Form({provided_date: @provided_date, el: el_contact_form, translate: @translate})
      el_contact_form.append(Haml.render(@template_type_form(), {locals: {types: @types.toJSON(), type_selected: @type_selected.toJSON(), contact: @contact.toJSON(), name: "contact[types_attributes][0]", translate: @translate.toJSON()}}))

  update: (event) ->
    self = @
    data = $(@id_form_edit_contact).toJSON()
    @contact.save(data,{
      success: (contact, response) ->
        if _.isUndefined(self.provided_date)
          window.location.hash = "#/contacts"
        else
          data["provided_date"]["date_at"] = data["provided_date"]["date_at"].split("/").reverse().join("-")

          self.provided_date.save(data,{ 
            success: (provided_date, response) ->
              self.type_selected.save(data,{
                success: (type, response) ->
                  window.location.hash = "#/items/"+type.item_id+"/types/"+type.id+"/contacts"
                error: (type, response) ->
                  alert("Type Error")
                  console.log type
              })
            error: (provided_date, response) ->
              alert("Provided Date Error")
              console.log provided_date
          })

          # 
      error: (contact_response_error, response_contact_error) ->
        new App.Common.CommonViews.Notice.Notice({response_errors: contact_response_error.errors})
    })
    return false
