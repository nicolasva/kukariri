class App.Friend extends Backbone.Model
  defaults:
    follow: false
    friend: false
  
  initialize: (translate) ->
    @translate = translate

  url: ->
    base = App.routing({}, "friends")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    message_empty = @translate.errors.empty unless _.isEmpty(@translate)
    @errors = new Array()
    if attributes.friend?
      @errors.push @translate.activerecord.attributes.friend.follow + " " + message_empty unless attributes.friend.follow? and attributes.friend.follow isnt ""
      @errors.push @translate.activerecord.attributes.friend.friend + " " + message_empty unless attributes.friend.friend? and attributes.friend.friend isnt ""
      @errors.push @translate.activerecord.attributes.friend.accept_friend + " " + message_empty unless attributes.friend.accept_friend? and attributes.friend.accept_friend isnt ""
    else
      @errors.push @translate.activerecord.attributes.friend.follow + " " + message_empty unless attributes.follow? and attributes.follow isnt ""
      @errors.push @translate.activerecord.attributes.friend.friend + " " + message_empty unless attributes.friend? and attributes.friend isnt ""
      @errors.push @translate.activerecord.attributes.friend.accept_friend + " " + message_empty unless attributes.accept_friend? and attributes.accept_friend isnt ""
    return @errors if @errors.length > 0

