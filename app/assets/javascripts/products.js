/* This was a very time consuming piece of code to write. This code takes the value of
room_for_furniture selected and uses it to populate the furniture_types selector.
It was difficult to figure out how to get jquery to read the custom html attribute
that was attached to the room_for_furniture select options */
var populate_furniture_types;
$(document).ready(function() {
  if ($("#product_room_for_furniture")) {
    populate_furniture_types();
    return $("#product_room_for_furniture").change(function() {
      //the .change function is what recoginzes the change in the room_for_furniture selector by the user
      return populate_furniture_types();
    });
  }
});
populate_furniture_types = function() {
  var $furniture_types_select, data, furniture_room_id;
  $furniture_types_select = $("select#product_furniture_type");
  $furniture_types_select.attr("disabled", "disabled");
  /* below finds the element by the html attribute data-roomid (declared/defined in _form.html.erb)
  this was very difficult because the .attr() method does not work without the use of ">option:selected"
  within the $("select#product_room_for_furniture"). I wanted to access a custom html attribute because
  the rails scaffold sets up many things for me and using the selector I wanted to store the value of
  room_for_furniture as a legible string instead of an arbitrary int (if was an int i would need to convert
  back to the room it represented everytime i wanted to display it) */
  furniture_room_id = $("select#product_room_for_furniture>option:selected").attr("data-roomid");
  furniture_room_val = $("select#product_room_for_furniture").val();
  /* furniture_room_id is matched up against the foriegn key added to the furniture_types db table.
  The foriegn key is what references the furniture_rooms db table items to the the furniture_types.
  The method show_furniture_types was written in the furniture_types_controller to find the furniture_room_id
  that corresponds to each furniture type */
  console.log(furniture_room_id);
  if (furniture_room_val === "") {
    return $furniture_types_select.html("<option value=\"\">(select the furniture room first)</option>");
  } else {
    $furniture_types_select.html("<option value=\"\">(loading furniture types...)</option>");
    data = {
      furniture_room_id: furniture_room_id
    };
    data[window._auth_token_name] = window._auth_token;
    return $.ajax("/show_furniture_types", {
      /* The /show_furniture_types controller method must be defined as a post method in routes.rb in order to
      allow the ajax request display the method*/
      type: "post",
      dataType: "json",
      data: data,
      success: function(furniture_types) {
        var furniture_type, _html, _i, _len;
        _html = '<option value="">Select the furniture type:</option>';
        for (_i = 0, _len = furniture_types.length; _i < _len; _i++) {
          furniture_type = furniture_types[_i];
          _html += '<option value="' + furniture_type.furniture_class + '">' + furniture_type.furniture_class + '</option>';
          /* within the furniture_types db table the individual furniture types are referred to as furniture_class
          (eg. nightstand or kitchen table) this method allows the ajax request to show the corresponding furniture_types
          (for each room_for_furniture) in the next selector. The value stored to the db and the value shown are the same
          in this case (furniture_type.furniture_class)*/
        }
        $furniture_types_select.html(_html);
        return $furniture_types_select.removeAttr("disabled");
      },
      error: function() {
        return alert('Error trying to load furniture types.');
      }
    });
  }
};
