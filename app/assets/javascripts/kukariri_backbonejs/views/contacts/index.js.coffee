class App.Views.Contacts.Index extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/index"]

  initialize: (options) ->
    unless _.isUndefined(options.item_id)
      @item_id = options.item_id
      @type_id = options.type_id
      @template_contact_edit_delete = JST["kukariri_backbonejs/templates/contacts/_contact_edit_delete_with_item"]
    else
      @template_contact_edit_delete = JST["kukariri_backbonejs/templates/contacts/_contact_edit_delete_no_item"] 
    @contacts = options.contacts
    @render()

  render: ->
    self = @
    $(@el).html(Haml.render(@template(), {locals: {contacts: @contacts.toJSON()}}))
    $.each(@contacts.toJSON(), (key,val) ->
      @el_tr_contact_lists = "#contact_lists_"+val.id
      unless _.isUndefined(self.item_id)
        $(@el_tr_contact_lists).append(Haml.render(self.template_contact_edit_delete(), {locals: {contact: val, item_id: self.item_id, type_id: self.type_id}}))
      else
        $(@el_tr_contact_lists).append(Haml.render(self.template_contact_edit_delete(), {locals: {contact: val}}))
    )

