$(function() {
  $("input:visible:enabled:first").focus();
  
  
  
  $('.add_reply').click(function() {
    $('#reply_form').fadeIn('slow');
    $(this).delay(500).fadeOut('slow');
    return false
  });
});