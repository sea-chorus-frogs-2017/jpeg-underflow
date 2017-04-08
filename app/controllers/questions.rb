get '/questions' do
  erb :'/questions/index'
end

get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  question_asked = params[:question]
  poster_id = session[:user][:id]
  new_question = Question.create(question_text: question_asked, user_id: poster_id)
  redirect to "/questions/#{new_question.id}"
end

get '/questions/:id' do
  erb :'/questions/show'
end
