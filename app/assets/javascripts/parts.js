$(document).ready(function() {
  // console.log($.parseJSON(gon.json.parts))

  if (typeof gon =='object' && typeof gon.json =='object') {
    $.each($.parseJSON(gon.json.parts), function( index, value ) {
      internal_id = value.internal_id
      $('#price_'+internal_id).text(value.price + ' MDL')
      $.each(value.stock, function( index, value ) {
        $('#'+index+'_'+internal_id+' span.total').text(value)
      })
    });
  }

  $('.part_name').hover(function() {
    /* Stuff to do when the mouse enters the element */
    $(this).popover('show', {placement: 'top'});
  }, function() {
    /* Stuff to do when the mouse leaves the element */
    $(this).popover('hide');
  });

  if ($('#query').length > 0) {
    $('#query').keyup(function(event) {
      if ($('#query').val().length >= 3) {
        $('.search_form .btn.btn-primary').removeAttr('disabled')
      } else {
        $('.search_form .btn.btn-primary').prop("disabled", true)
      }
    });
  }
});
