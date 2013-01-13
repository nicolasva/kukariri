class App.Common.CommonViews.Notice.Notice extends Backbone.View
  el: ".notice"
  template: JST["kukariri_backbonejs/common/common_templates/notice/notice"]
  
  initialize: (options) ->
    @response_errors = options.response_errors
    @render()

  render: ->
    $(@el).html(Haml.render(@template(), {locals: {response_errors: @response_errors}}))

