$(function() {
  var first_input = $("input:visible:enabled:first").val();
  if(first_input.length == 0){
    $("input:visible:enabled:first").focus();
  }
  
  $('.add_reply').click(function() {
    $('#reply_form').fadeIn('slow');
    $(this).delay(500).fadeOut('slow');
    return false
  });
});