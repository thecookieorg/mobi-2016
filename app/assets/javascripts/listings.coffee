# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    hot_spots = $('#listing_hot_spot_id').html()
    $('#listing_city_id').change ->
        city = $('#listing_city_id :selected').text()
        options = $(hot_spots).filter("optgroup[label='#{city}']").html()
        if options
            $('#listing_hot_spot_id').html(options)
            $('#listing_hot_spot_id').parent().show()
        else
            $('#listing_hot_spot_id').empty()
            $('#listing_hot_spot_id').parent().hide()