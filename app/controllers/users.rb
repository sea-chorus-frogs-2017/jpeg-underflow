enable :sessions

post '/users' do
  user = User.new(params[:user])
  user.save
  if user.persisted?
    # Hello, TEAM JPEG! I changed the session key from user to user_id
    # because I was running into issues with the cookie being too large
    # session[:user] = user
    session[:user_id] = user.id
    redirect '/'
  else
    erb :"_registration-form"
  end
end

get '/users/new' do
  erb :"_registration-form"
end
