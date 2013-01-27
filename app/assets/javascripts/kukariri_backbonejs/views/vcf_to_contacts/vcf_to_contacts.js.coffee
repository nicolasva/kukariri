class App.Views.VcfToContacts.VcfToContacts extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/vcf_to_contacts/create"]

  events: 
    "submit #add_vcf_cart_to_contact": "create"

  initialize: (options) ->
    @translate = options.translate
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {translate: @translate}}))
    @uploader()

  uploader: ->
    $("#uploader").pluploadQueue({
      runtimes: 'gears,flash,silverlight,browserplus,html5'
      url: '/attachments.js'
      max_file_size: '10mb'
      chunk_size: '1mb'
      unique_games: true
      multipart_params:
        authenticity_token: $('meta[name=csrf-token]').attr('content'),
        '_kukariri_session': $('meta[name=session-key-value]').attr('content'),
        attachment_type: "vcf_to_contacts"
      
      filters : [
        {title: "vcf card", extensions: "vcf"}
      ]

      flash_swf_url: '/assets/flash/plupload.flash.swf'

      silverlight_xap_url: '/assets/silverlight/plupload.silverlight.xap'
    })

  create: (event) ->
    uploader = $("#uploader").pluploadQueue()
    if uploader.files.length > 0
      uploader.bind('StateChanged', ->
        $("#add_vcf_cart_to_contact")[0].submit() if uploader.files.length == (uploader.total.uploaded + uploader.total.failed)
      )
      uploader.start()
    else
      alert("You must queue at least on file.")

    return false




