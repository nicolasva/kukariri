class App.Routers.Friends extends Backbone.Router
  routes: 
    App.routing_yaml.routing_backbonejs.API.friends.routes

  initialize: ->
    self = @
    @translate = new App.Translate()
    @friend = new App.Friend()
    @userSearchToContacts = new App.Collections.UserSearchToContacts()
    @userSearchToContacts.fetch
      success: (collection, response) ->
        self.translate.fetch
          success: () ->
            @viewUserSearchContacts = new App.Views.Friends.Index({contacts: collection, friend: self.friend, translate: self.translate})
