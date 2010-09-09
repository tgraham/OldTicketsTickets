$(function() {
  $("input:visible:enabled:first").focus();
  
  $.each($('.hideable'), function() {
    $(this).delay(4000).fadeOut('fast');
  });
  
  $('.add_reply').click(function() {
    $('#reply_form').fadeIn('slow');
    $(this).delay(500).fadeOut('slow');
    return false
  });
});