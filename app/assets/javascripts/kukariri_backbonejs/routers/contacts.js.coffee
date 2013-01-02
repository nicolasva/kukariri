class App.Routers.Contacts extends Backbone.Router
  routes:
    "/items/:item_id/types/:type_id/contacts": "index"
    "/items/:item_id/types/:type_id/contacts/:id/delete": "destroy"
    "/items/:item_id/types/:type_id/contacts/:id/edit" : "edit"
    "/items/:item_id/types/:type_id/contacts/new" : "new"

  initialize: ->
    @contacts = new App.Collections.Contacts()
    @types = new App.Collections.Types()

  index: (item_id, type_id) ->
    @contacts.item_id = item_id
    @contacts.type_id = type_id
    @contacts.fetch
      success: (collection, response) ->
        @ViewsContactsIndex = new App.Views.Contacts.Index({contacts: collection, item_id: item_id, type_id: type_id})

  destroy: (item_id, type_id, id) ->
    @contacts.item_id = item_id
    @contacts.type_id = type_id
    contact = @contacts.get(id)
    contact.destroy
      success: (contact, response) ->
        window.location.hash = "#/items/"+item_id+"/types/"+type_id+"/contacts"
      error: (contact, response) ->
        alert("Error")
        console.log contact.toJSON()

  edit: (item_id, type_id, id) ->
    @contacts.item_id = item_id
    @contacts.type_id = type_id
    #contact = @contacts.get(id)
    #contact.item_id = item_id
    #contact.type_id = type_id
    #hash_contact = 
    #  id: id
    #  contact:
    #    types_attributes:
    #      O:
    #        id: type_id
    #        contact_id: id
    #console.log hash_contact
    #contact.save(hash_contact, {
    #  success: (contact, response) ->
    #    alert("nicolas")
    #  error: (contact, response) ->
    #    alert("nicolas")
    #})
    @types.item_id = item_id
    self = @
    type = new App.Type(id: type_id)
    type.item_id = item_id
    contact = @contacts.get(id)
    contact.item_id = item_id
    contact.type_id = type_id
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
                hash_provided_date = 
                  contact_id: id
                  item_id: item_id
                  date_at: day + "-" + month + "-" + year
                console.log hash_provided_date
                @provided_date = new App.ProvidedDate()
                @provided_date.item_id = item_id
                @provided_date.type_id = type_id
                @provided_date.contact_id = id
                @provided_date.save(hash_provided_date)
                @provided_date.fetch 
                  success: (model_provided_date, response_provided_date) ->
                    @ViewContactsEdit = new App.Views.Contacts.Edit({contact: model, type_selected: model_type_selected, types: collection, provided_date: model_provided_date})
                hash_type = 
                  id: type_id
                  type:
                    contact_id: id
                type.save(hash_type)

      error: (model, response) ->
        alert("Error")
        console.log model.toJSON()

  new: (item_id, type_id) ->
    @contact = new App.Contact()
    @contact.item_id = item_id
    @contact.type_id = type_id
    @contact.fetch
      success: (model, response) ->
        @ViewContactNew = new App.Views.Contacts.New({contact: model, item_id: item_id, type_id: type_id})

