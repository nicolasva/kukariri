class App.Views.VcfToContacts.VcfToContacts extends Backbone.View
  el: ".container"
  template: JST["kukariri_backbonejs/templates/vcf_to_contacts/create"]

  events: 
    "click #add_vcf_cart_to_contact": "create"

  initialize: (options, callback) ->
    @callback = callback
    @translate = options.translate
    @render()
    @uploaded = $("#uploader").pluploadQueue({
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


  render: ->
    $(@el).html(Haml.render(@template(), {locals: {translate: @translate}}))
  
  create: (event) ->
    @uploader = $('#uploader').pluploadQueue()
    console.log @uploader.files
    #if @uploaded.files.length > 0
    #  @uploaded.bind('StateChanged', ->
    #    console.log(@uploaded.files) 
        #if @uploaded.files.length == (@uploaded.total.uploaded + @uploaded.total.failed)
        #  )
        #@uploaded.start()
        #return false

