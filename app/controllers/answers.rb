post '/answers/new' do
  puts 'in answers.rb controller, /answers/new POST was hit'
  # create a new answer object and save to database
  puts "params to follow in POST /answers/new"
  p params
  if request.xhr?
    # ajax request
    puts 'this is a POST ajax request'
  else
    puts 'this is NOT an ajax request - post'
  end
  puts 'request to follow:'
  p request
  new_answer = Answer.create(params[:answer])
  puts 'about to print new_answer that was just created'
  puts 'answer text is: ' + new_answer.answer_text
  puts 'question id is: ' + new_answer.question_id.to_s
  puts 'user id is: ' + new_answer.user_id.to_s
  # return a partial that has new answer information in it
  erb :"/answers/_answer-item", layout: false, locals: {answer: new_answer}  
end

get '/answers/new' do
  # return new answer form (partial)
  puts 
  puts
  puts 'in answers.rb controller,/answers/new GET was hit'
  puts 'we need to return the partial'
  if request.xhr?
    # ajax request
    puts 'this is an ajax request GET'
  else
    puts 'this is NOT an ajax request - get'
  end
  puts 'request to follow:'
  p request
  # do not include layout with html we are returning
  erb :"/answers/_new-answer-form", layout: false
end