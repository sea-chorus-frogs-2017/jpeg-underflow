get '/questions' do
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :"/questions/show"
end
