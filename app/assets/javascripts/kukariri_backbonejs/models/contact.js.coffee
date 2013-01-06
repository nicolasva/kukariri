class App.Contact extends Backbone.Model
  defaults:
    lastname: "Lastname"
    firstname: "Fistname"
    email: "<email>@<server>.<com,fr>"
    tel_home: "Home Phone Number"
    tel_mobil: "Mobile Phone Number"
    adress: "Adress"
    country: "Country"

  url: ->
    unless _.isUndefined(@item_id)
      base = "/items/#{@item_id}/types/#{@type_id}/contacts"
    else
      base = "/contacts"
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes

