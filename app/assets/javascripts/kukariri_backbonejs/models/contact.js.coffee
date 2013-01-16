class App.Contact extends Backbone.Model

  #translate: new App.Translate()
  defaults:
    lastname: "Lastname"
    firstname: "Fistname"
    email: "<email>@<server>.<com,fr>"
    tel_home: "Home Phone Number"
    tel_mobil: "Mobile Phone Number"
    adress: "Adress"
    country: "Country"
  
  initialize: (translate) ->
    @translate = translate

  url: ->
    unless _.isUndefined(@item_id)
      base = App.routing({item_id: @item_id, type_id: @type_id}, "contacts")
    else
      base = App.routing({}, "contacts_bis")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    message_empty = @translate.errors.messages.empty unless _.isEmpty(@translate) 
    @errors = new Array()
    if attributes.contact?
      @errors.push @translate.activerecord.attributes.contact.lastname+" "+message_empty unless attributes.contact.lastname? and attributes.contact.lastname isnt ""
      @errors.push @translate.activerecord.attributes.contact.firstname+" "+message_empty unless attributes.contact.firstname? and attributes.contact.firstname isnt ""
      @errors.push @translate.activerecord.attributes.contact.country+" "+message_empty unless attributes.contact.country? and attributes.contact.country isnt "" 
    else
      @errors.push @translate.activerecord.attributes.contact.lastname+" "+message_empty unless attributes.lastname? and attributes.lastname isnt ""
      @errors.push @translate.activerecord.attributes.contact.firstname+" "+message_empty unless attributes.firstname? and attributes.firstname isnt ""
      @errors.push @translate.activerecord.attributes.contact.country+" "+message_empty unless attributes.country? and attributes.country isnt ""
      #console.log translate
    return @errors if @errors.length > 0

