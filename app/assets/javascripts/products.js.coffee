

$(document).ready ->
    if $("#product_room_for_furniture")
      populate_furniture_types()
      $("#product_room_for_furniture").change ->
        populate_furniture_types()

populate_furniture_types = ->
  $furniture_types_select = $("select#product_furniture_type")
  $furniture_types_select.attr "disabled", "disabled"
  furniture_room_id = $("select#product_room_for_furniture").val()
  console.log(furniture_room_id)
  if furniture_room_id is ""
    $furniture_types_select.html "<option value=\"\">(select the furniture room first)</option>"
  else
    $furniture_types_select.html "<option value=\"\">(loading furniture types...)</option>"
    alert(furniture_room_id)
    data = {furniture_room_id: furniture_room_id}
    data[window._auth_token_name] = window._auth_token
    $.ajax "/show_furniture_types",
      type: "post"
      dataType: "json"
      data: data
      success: (furniture_types) ->
        _html = '<option value="">Select the furniture type:</option>'
        _html += '<option value="'+furniture_type.furniture_class+'">'+furniture_type.furniture_class+'</option>' for furniture_type in furniture_types
        $furniture_types_select.html _html
        $furniture_types_select.removeAttr "disabled"
      error: ->
        alert 'Error trying to load furniture types.'
