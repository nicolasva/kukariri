class App.GoogleContactsToContact extends Backbone.Model
  defaults: 
    email: "email@gmail.com"

  initialize: (translate) ->
    @translate = translate

  url: ->
    base = App.routing({}, "google_contacts_to_contacts")

  validate: (attributes) ->
    message_empty = @translate.errors.messages.empty unless _.isEmpty(@translate)
    @errors = new Array()
    if attributes.google_contacts_to_contact?
      @errors.push @translate.activerecord.attributes.google_contacts_to_contact.email+" "+message_empty unless attributes.google_contacts_to_contact.email? and attributes.google_contacts_to_contact.email isnt ""
      @errors.push @translate.activerecord.attributes.google_contacts_to_contact.password+" "+message_empty unless attributes.google_contacts_to_contact.password? and attributes.google_contacts_to_contact.password isnt ""
    else
      @errors.push @translate.activerecord.attributes.google_contacts_to_contact.email+" "+message_empty unless attributes.email? and attributes.email isnt ""
      @errors.push @translate.activerecord.attributes.google_contacts_to_contact.password+" "+message_empty unless attributes.password? and attributes.password isnt ""

    return @errors if @errors.length > 0


