
get '/questions' do
  @questions = Question.all
  session.delete(:question_id)
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  session[:question_id] = @question.id
  erb :"/questions/show"
end

post '/questions' do
  question_asked = params[:question]
  # Hello, TEAM JPEG! Sparky changed the session key from user to user_id
  # because she was running into issues with the cookie being too large
  poster_id = session[:user_id]
  new_question = Question.create(question_text: question_asked, user_id: poster_id)
  redirect to "/questions/#{new_question.id}"
end
