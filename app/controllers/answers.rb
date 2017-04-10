
put '/answers/:id' do
  # user has requested to vote an answer as best answer
  # if user is logged in, mark best field in answers record
  # and return a partial to display best status next to selected answer
  if request.xhr?
    # ajax request
    if session[:user_id]
      # user is logged in; okay to mark as best
      answer.update_attributes best: true
      erb :"/answers/_best-answer-item", layout: false, locals: {best: true}
    else
      @add_answer_error = "To mark an answer as BEST, please log in."
    end
  else
    # not an ajax request
  end
end


get '/answers/new' do
  # user has requested to add an answer
  # if user is logged in, return a "new answer" form (partial)
  if request.xhr?
    # ajax request
    if session[:user_id]
      # user is logged in; okay to return new answer form
      erb :"/answers/_new-answer-form", layout: false
    else
      @add_answer_error = "To post an answer, please log in."
    end
  else
    # not an ajax request
  end
end

post '/answers/new' do
  # user has typed in a new answer and has submitted it;
  # if user is logged in, save the answer and display it
  # at the end of the current answers
  if request.xhr?
    # ajax request
    if session[:user_id]
      new_answer = Answer.new({answer_text: params[:answer_text]} )
      User.find(session[:user_id]).answers << new_answer
      Question.find(session[:question_id]).answers << new_answer
      # return a partial that has new answer information in it
      erb :"/answers/_answer-item", layout: false, locals: {answer_text: params[:answer_text]}
    else
      # user is not logged in; posting an answer is not permitted
      # TEAM JPEG - Sparky needs help figuring out how to display this error message
      # right now, there is an "@" variable set, but it is not used by the .erb
      # javascript checks for this specific error and posts an alert if found
      # later, if this works, we should change the data format to JSON so that
      # we pass three key/value pairs:
      # success: (true or false)
      # errorMsg: (error message), and
      # htmlToAppend: (partial with new answer to append)
      @add_answer_error = "To post an answer, please log in."
    end
  else
    # not an AJAX request
  end
end
