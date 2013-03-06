class App.Views.Friends.IndexAllFriends extends Backbone.View
  el: ".dropdown-menu"
  template: JST["kukariri_backbonejs/templates/friends/index_all_friends"]

  initialize: (options) ->
    @friends = options.friends
    @translate = options.translate
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {friends: @friends.toJSON(), translate: @translate.toJSON()}}))
