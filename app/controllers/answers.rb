

get '/answers/new' do
  # user has requested to add an answer
  # if user is logged in, return a "new answer" form (partial)
  if request.xhr?
    # ajax request
    if session[:user_id]
      # user is logged in; okay to return new answer form
      erb :"/answers/_new-answer-form", layout: false
    else
      # user is not logged in; posting an answer is not permitted
      # TEAM JPEG - I need help figuring out how to display this error message
      @_add_answer_error = "To post an answer, please log in."
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
      # # return a partial that has new answer information in it
      erb :"/answers/_answer-item", layout: false, locals: {answer_text: params[:answer_text]}  
    else
      # user is not logged in; posting an answer is not permitted
      # TEAM JPEG - I need help figuring out how to display this error message
      @_add_answer_error = "To post an answer, please log in."
    end
  else
    # not an AJAX request
  end
end