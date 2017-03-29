ready = ->
  $("#add-more-photos").click (e) ->
    e.preventDefault()
    $(".property-photos").append('<p><input type="file" name="properties_photos[]"></p>')

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('turbolinks:load', ready);