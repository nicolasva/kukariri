class App.Collections.UserSearchToContacts extends Backbone.Collection
  url: ->
    App.routing({}, "user_search_to_contacts")
