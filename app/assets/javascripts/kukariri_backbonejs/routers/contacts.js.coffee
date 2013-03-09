class App.Routers.Contacts extends Backbone.Router
  routes:
    App.routing_yaml.routing_backbonejs.API.contacts.routes

  initialize: ->
    @translate = new App.Translate()
    @provided_dates = new App.Collections.ProvidedDates()
    @provided_date = new App.ProvidedDate()
    @contacts = new App.Collections.Contacts()
    @countries = new App.Collections.Countries()
    @regions = new App.Collections.Regions()
    @types = new App.Collections.Types()

  index: (login_id, item_id, type_id) ->
    $(".notice").show()
    $("#loader").show()
    self = @
    @contacts.item_id = item_id
    @contacts.type_id = type_id
    @contacts.login_id = login_id
    @translate.fetch
      success: () ->
        self.contacts.fetch
          success: (collection, response) ->
            @ViewsContactsIndex = new App.Views.Contacts.Index({contacts: collection, login_id: login_id, item_id: item_id, type_id: type_id, translate: self.translate, link: "/#/users/"+login_id+"/items/"+item_id+"/types/"+type_id+"/contacts/new"})

  index_all: (login_id) ->
    $(".notice").show()
    $("#loader").show()
    self = @
    self.contacts.login_id = login_id
    @translate.fetch
      success: () ->
        self.contacts.fetch
          success: (collection, response) =>
            @ViewsContactsIndex = new App.Views.Contacts.Index({contacts: collection, translate: self.translate, link: "/#/users/#{login_id}/contacts/new", login_id: login_id})

  edit_all: (login_id, id) ->
    self = @
    @contact = @contacts.get(id)
    @contact.login_id = login_id
    @contact.translate = @translate.toJSON()
    @translate.fetch
      success: () ->
        self.contact.fetch
          success: (model, response) ->
            self.countries.fetch
              success: (collection_countrie, response) ->
                @viewContactnew = new App.Views.Contacts.Edit({contact: model, translate: self.translate, regions: self.regions, countries: collection_countrie})


  new_contact: (login_id) ->
    self = @
    @contact = new App.Contact()
    @contact.translate = @translate.toJSON()
    @contact.login_id = login_id
    @translate.fetch
      success: () ->
        self.contact.fetch
          success: (model, response) ->
            self.countries.fetch 
              success: (collection, response_collection) ->
                @ViewsContactsNewContact = new App.Views.Contacts.NewContact({contact: model, translate: self.translate, countries: collection, regions: self.regions})

  destroy_all: (login_id, id) ->
    contact = @contacts.get(id)
    contact.login_id = login_id
    contact.translate = @translate.toJSON()
    contact.destroy()
    window.location.hash = "#/users/"+login_id+"/contacts"

  destroy: (login_id, item_id, type_id, id) -> 
    @contacts.item_id = item_id
    @contacts.type_id = type_id
    @contacts.login_id = login_id
    contact = @contacts.get(id)
    contact.translate = @translate.toJSON()
    contact.login_id = login_id
    contact.destroy()
    window.location.hash = "#/users/"+login_id+"/items/"+item_id+"/types/"+type_id+"/contacts"

  edit: (login_id, item_id, type_id, id) ->
    @contacts.item_id = item_id
    @contacts.type_id = type_id
    @contacts.login_id = login_id
    @types.item_id = item_id
    @types.login_id = login_id
    self = @
    type = new App.Type(id: type_id)
    type.item_id = item_id
    type.login_id = login_id
    contact = new App.Contact(id: id)
    contact.translate = @translate.toJSON()
    contact.item_id = item_id
    contact.type_id = type_id
    contact.login_id = login_id
    @translate.fetch
      success: () ->
        contact.fetch
          success: (model, response) ->
            type.fetch
              success: (model_type_selected, response_type_selected) ->
                self.types.fetch
                  success: (collection, response_type) ->
                    currentTime = new Date()
                    month = currentTime.getMonth() + 1
                    day = currentTime.getDate()
                    year = currentTime.getFullYear()
                    current_time_sql_datetime = day + "-" + month + "-" + year
                    self.provided_dates.item_id = item_id
                    self.provided_dates.type_id = type_id
                    self.provided_dates.contact_id = id
                    self.provided_dates.login_id = login_id
                    self.provided_dates.fetch 
                      success: (collection_provided_date, response_provided_date) ->
                        if _.isNull(model_type_selected.toJSON().contact_id)
                          hash_type = 
                            id: type_id
                            type:
                              contact_id: id
                          type.save(hash_type)
                        if _.isEmpty(collection_provided_date.toJSON())
                          hash_provided_date = 
                            contact_id: id
                            item_id: item_id
                            date_at: day + "-" + month + "-" + year
                          self.provided_date.save(hash_provided_date)
                        else
                          self.provided_date = self.provided_dates.get(collection_provided_date.toJSON()[0].id) 
                          
                        self.provided_date.item_id = item_id 
                        self.provided_date.type_id = type_id
                        self.provided_date.contact_id = id
                        self.provided_date.login_id = login_id
                        self.provided_date.fetch
                          success: (model_provided_date, response_model_provided_date) ->
                            self.countries.fetch
                              success: (collection_country, response_country) ->
                                @ViewContactsEdit = new App.Views.Contacts.Edit({contact: model, login_id: login_id, type_selected: model_type_selected, types: collection, provided_date: model_provided_date, translate: self.translate, regions: self.regions, countries: collection_country})
          error: (model, response) ->
            alert("Error")
            console.log model.toJSON()

  new: (login_id, item_id, type_id) ->
    @types.item_id = item_id
    @types.login_id = login_id
    @contact = new App.Contact()
    @contact.item_id = item_id
    @contact.type_id = type_id
    @contact.login_id = login_id
    self = @
    type = new App.Type(id: type_id)
    type.item_id = item_id
    type.login_id = login_id
    @translate.fetch
      success: () ->
        self.contact.fetch
          success: (model, response) ->
            self.types.fetch 
              success: (collection, response) ->
                type.fetch
                  success: (type_selected, response_selected) ->
                    self.provided_date.item_id = item_id
                    self.provided_date.type_id = type_id
                    self.provided_date.contact_id = "new"
                    self.provided_date.login_id = login_id
                    self.provided_date.fetch
                      success: (provided_date, response_provided_date) ->
                        self.countries.fetch
                          success: (collection, response) ->
                            @ViewContactNew = new App.Views.Contacts.New({contact: model, item_id: item_id, type_id: type_id, types: collection, type_selected: type_selected, provided_date: provided_date, translate: self.translate, countries: collection, regions: self.regions, login_id: login_id})

