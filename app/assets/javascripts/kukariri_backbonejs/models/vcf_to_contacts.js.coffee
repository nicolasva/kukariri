class App.VcfToContact extends Backbone.Model
  url: ->
    base = App.routing({}, "vcf_to_contacts")
    return base if @isNew()
    base + (if base.charAt(base.length - 1) is "/" then "" else "/") + @id

  validate: (attributes) ->
    "Error!" unless attributes
