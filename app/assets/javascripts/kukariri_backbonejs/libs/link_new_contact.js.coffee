class App.Libs.LinkNewContact extends Backbone.View
  initialize: (options) ->
    $(window).bind 'hashchange', ->
        regex = new RegExp("^.{1,}types.{1,}contacts$")
        window_location_hash = window.location.hash
        login_id = window_location_hash.split("/")[2]
        if regex.test(window_location_hash) == true
          item_id = window_location_hash.split("/")[4]
          type_id = window_location_hash.split("/")[6]
          $($(".header").children().first().children()[1]).children().first().attr("href", "#/users/#{login_id}/items/#{item_id}/types/#{type_id}/contacts/new")
        else
          $($(".header").children().first().children()[1]).children().first().attr("href", "#/users/#{login_id}/contacts/new")
