class App.Libs.TableSorter extends Backbone.View
  initialize: (options) ->
    @el = options.el
    @tablesorter()

  tablesorter: ->
    $(self.el).tablesorter()