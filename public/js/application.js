$(document).ready(function() {
  $('button#comment-button').on("click", function(event) {
    event.preventDefault();
    $(this).siblings().removeClass('hidden');
  });

  // when "add answer" button is clicked, prevent default behavior
  // and display "new answer" form
  $('#add-answer-button').on('click',function(origEvent) {
    origEvent.preventDefault();
    $.ajax ({
      url: '/../../answers/new',
      type: 'GET'
    }).done(function(response) {
      if (response === "To post an answer, please log in.") {
        alert(response);
      }
      else {
        $('#new-answer-container').append(response);
      };
    });
  });

  // when new answer is submitted, send ajax post with entered data to server
  // when response is returned, clear new answer form/post button
  // and display new answer
  $('#new-answer-container').submit(function(origEvent) {
    origEvent.preventDefault();
    new_answer = $('#new-answer').val()
    $.ajax({
      url: '/../../answers/new',
      type: 'POST',
      data: { answer_text: new_answer }
    }).done(function(response) {
      if(response === "To post an answer, please log in.") {
        alert(response);
      }
      else {
        // insert partial showing new answer 
        $('#answers-container').append(response);
        // clear new answer form
        $('#new-answer-container').empty()
      };
    });
  });
});