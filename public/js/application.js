$(document).ready(function() {
  $('button#comment-button').on("click", function(event) {
    event.preventDefault();
    $(this).siblings().removeClass('hidden');

  });
});
