class App.Views.Contacts.Index extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/contacts/index"]

  el_loader: "#loader"
  el_section_notice: ".notice"

  template_no_contact: JST["kukariri_backbonejs/templates/contacts/no_contact"]
 
  template_vcf_to_contacts: JST["kukariri_backbonejs/templates/vcf_to_contacts/link_to_export_vcf_to_contacts"]

  initialize: (options) ->
    @link = options.link
    unless _.isUndefined(options.item_id)
      @item_id = options.item_id
      @type_id = options.type_id
      @login_id = options.login_id
      @template_contact_edit_delete = JST["kukariri_backbonejs/templates/contacts/_contact_edit_delete_with_item"]
    else
      @template_contact_edit_delete = JST["kukariri_backbonejs/templates/contacts/_contact_edit_delete_no_item"] 
    @contacts = options.contacts
    @translate = options.translate
    @render()

  render: ->
    self = @
    span = "span4"
    if _.isEmpty(@contacts.toJSON())
      span = "span2"
      $(@el).html(Haml.render(@template_no_contact(), {locals: {translate: @translate.toJSON(), link: @link, span: span}})) 
    else
      $(@el).hide()
      $(@el).html(Haml.render(@template(), {locals: {contacts: @contacts.toJSON(), translate: @translate.toJSON()}}))
      $.each(@contacts.toJSON(), (key,val) ->
        @el_tr_contact_lists = "#contact_lists_"+val.id
        unless _.isUndefined(self.item_id)
          $(@el_tr_contact_lists).append(Haml.render(self.template_contact_edit_delete(), {locals: {contact: val, item_id: self.item_id, type_id: self.type_id, login_id: self.login_id, translate: self.translate.toJSON()}}))
        else
          $(@el_tr_contact_lists).append(Haml.render(self.template_contact_edit_delete(), {locals: {contact: val, translate: self.translate.toJSON()}}))
      )
    $(@el).children().first().append(Haml.render(self.template_vcf_to_contacts(), {locals: {translate: self.translate.toJSON(), span: span}})) 
    $(@el_section_notice).hide()
    $(@el_loader).hide()
    $(@el).show()  

