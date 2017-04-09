$(document).ready(function() {
// when "add answer" button is clicked, prevent default behavior
// and get new answer form from server
$('#add-answer-button').on('click',function(origEvent) {
  console.log('add answer button was clicked');
  origEvent.preventDefault();
  $.ajax ({
    url: '/../../answers/new',
    type: 'GET'
  }).done(function(response) {
    console.log('in DONE response in js file add answer button click');
    console.log('response value to follow:');
    console.log(response);
    $('#new-answer-container').append(response);
  })
})

// when new answer is submitted, send ajax post with entered data to server
// when response is returned, destroy new answer form and post button
// and display new answer
$('#new-answer-container').submit(function(origEvent) {
 origEvent.preventDefault();
 new_answer = $('#new-answer').val()
  console.log('submit button on new answer form was clicked');
  console.log('new answer entered is ' + new_answer)
  $.ajax({
    url: '/../../answers/new',
    type: 'POST',
    data: { answer_text: new_answer }
  }).done(function(response) {
    console.log('in response in js file submit new answer button click');
    console.log('response value to follow:');
    console.log(response);
    // insert partial question answer 
    $('#answers-container').append(response);
  });
});

});


