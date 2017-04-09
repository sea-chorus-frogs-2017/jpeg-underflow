$(document).ready(function() {

  // when "add answer" button is clicked, prevent default behavior
  // and display "new answer" form
  $('#add-answer-button').on('click',function(origEvent) {
    console.log('add answer button was clicked');
    origEvent.preventDefault();
    $.ajax ({
      url: '/../../answers/new',
      type: 'GET'
    }).done(function(response) {
      $('#new-answer-container').append(response);
    })
  })

  // when new answer is submitted, send ajax post with entered data to server
  // when response is returned, destroy new answer form and post button
  // and display new answer
  $('#new-answer-container').submit(function(origEvent) {
    origEvent.preventDefault();
    new_answer = $('#new-answer').val()
    $.ajax({
      url: '/../../answers/new',
      type: 'POST',
      data: { answer_text: new_answer }
    }).done(function(response) {
      // insert partial showing new answer 
      $('#answers-container').append(response);
    });
  });

});


