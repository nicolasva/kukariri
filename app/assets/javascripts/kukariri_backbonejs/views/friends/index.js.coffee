class App.Views.Friends.Index extends Backbone.View
  el: ".modal_box"
  template: JST["kukariri_backbonejs/templates/friends/index"]

  events:
    "click .cancel_friend": "cancel_friend"
    "click .add_friend": "add_friend"
    "click .follow_person": "follow_person"

  initialize: (options) ->
    @contacts = options.contacts
    @translate = options.translate
    @friend = options.friend
    @render()

  render: ->
    if @contacts.toJSON().length > 0
      $(@el).html(Haml.render(@template(), {locals: {contacts: @contacts.toJSON()}}))
      $(@el).show()

  add_friend: (event) ->
    id_friend = $(event.target).attr("id").split("_")[$(event.target).attr("id").split("_").length-1]
    hash_friend = 
      friend:
        follow: false
        friend: true
        accept_friend: false
        cancel: false
        user_ids: [id_friend]
    @friend.translate = @translate.toJSON()
    @friend.save(hash_friend)

  follow_person: (event) ->
    id_friend = $(event.target).attr("id").split("_")[$(event.target).attr("id").split("_").length-1]
    hash_friend = 
      friend:
        follow: true
        friend: false
        accept_friend: false
        cancel: false
        user_ids: [id_friend]
    @friend.translate = @translate.toJSON()
    @friend.save(hash_friend)
  
  cancel_friend: (event) ->
    id_friend = $(event.target).attr("id").split("_")[$(event.target).attr("id").split("_").length-1]
    hash_friend = 
      friend:
        follow: false
        friend: false
        accept_friend: false
        cancel: true
        user_ids: [id_friend]
    @friend.translate = @translate.toJSON()
    @friend.save(hash_friend)

