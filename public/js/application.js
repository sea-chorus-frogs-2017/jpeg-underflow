$(document).ready(function() {
  $("#register-button").on("click", function(event) {
    event.preventDefault();
    $.ajax({
      url: '/users',
      method: 'POST',
      data: $('#login-register').serialize()
    }).done(function(response) {
      console.log(response);
    });
  });
});
