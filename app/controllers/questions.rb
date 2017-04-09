

get '/questions' do
  @questions = Question.all
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
  poster_id = session[:user_id]
  new_question = Question.create(question_text: question_asked, user_id: poster_id)
  redirect to "/questions/#{new_question.id}"
end
