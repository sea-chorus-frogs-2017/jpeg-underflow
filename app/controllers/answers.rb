

get '/answers/new' do
  # user has requested to add an answer
  # if user is logged in, return a "new answer" form (partial)
  if request.xhr?
    # ajax request
    # do not allow user to answer question unless he or she is logged in
    if session[:user_id]
      # user is logged in; okay to return new answer form
      erb :"/answers/_new-answer-form", layout: false
    else
      # TEAM JPEG - I need help figuring out how to display this error message
      @_add_answer_error = "To post an answer, please log in."
    end
  else
    # not an ajax request
  end
end

post '/answers/new' do
  # user has typed in a new answer and has submitted it
  # if user is logged in, save the answer and display it 
  # at the end of the current answers
  puts 'in answers.rb controller, /answers/new POST was hit'
  # create a new answer object and save to database
  puts "params to follow in POST /answers/new"
  p params
  if request.xhr?
    # ajax request
    puts 'this is a POST ajax request'
    puts 'request to follow:'
    p request
    puts 'params[:answer_text] to follow'
    p params[:answer_text]
    puts 'session[:user_id] to follow'
    p session[:user_id]
    puts 'session[:question_id] to follow'
    p session[:question_id]
    new_answer = Answer.new({answer_text: params[:answer_text]} )
    this_user=User.find(session[:user_id])
    puts 'this user to follow'
    p this_user
    this_question = Question.find(session[:question_id])
    p this_question
    this_user.answers << new_answer
    this_question.answers << new_answer
    puts "JUSt UPDATED foreign key to reflect user and question"
    answer_object=Answer.find(new_answer.id)
    puts 'answer object to follow'
    p answer_object
    # puts 'about to print new_answer that was just created'
    # puts 'answer text is: ' + new_answer.answer_text
    # puts 'question id is: ' + new_answer.question_id.to_s
    # puts 'user id is: ' + new_answer.user_id.to_s
    # # return a partial that has new answer information in it
    erb :"/answers/_answer-item", layout: false, locals: {answer_text: params[:answer_text]}  
  else
    # not an AJAX request
    puts 'this is NOT an ajax request - post'
  end
end