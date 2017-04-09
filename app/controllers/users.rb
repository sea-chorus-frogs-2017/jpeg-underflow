enable :sessions

post '/users' do
  user = User.new(params[:user])
  user.save
  if user.persisted?
    session[:user_id] = user.id
    redirect '/'
  else
    erb :"_registration-form"
  end
end

get '/users/new' do
  erb :"_registration-form"
end
