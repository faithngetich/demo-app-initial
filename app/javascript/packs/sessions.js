$(document).ready(function() {
  var checkForOneTouch = function() {
    $.get('/authy/status', function(data) {
      if (data === 'approved') {
        window.location.href = '/account';
      }else {
        setTimeout(checkForOneTouch, 2000);
      }
    });
  };
  var attemptOneTouchVerification = function(form) {
    $.post('/sessions', form, function(data) {
      $('#authy-modal').modal({backdrop:'static'},'show');
      if (data.success) {
        var fadeIn = $('.auth-ot');
        $('.auth-ot').fadeIn();
        checkForOneTouch()
      } else {
        $('.auth-token').fadeIn();
      }
    });
  };
  $('#login-form').submit(function(e) {
    e.preventDefault();
    var formData = $(e.currentTarget).serialize();
    attemptOneTouchVerification(formData);
  });
 });
 