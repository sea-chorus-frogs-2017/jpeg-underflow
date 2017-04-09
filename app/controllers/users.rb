enable :sessions

post '/users' do
  puts "IN POST /USERS"
  puts 'params to follow'
  p params
  user = User.new(params[:user])
  puts "JUST CREATED NEW USER, user to follow"
  p user
  user.save
  if user.persisted?
    # Hello, TEAM JPEG! Sparky changed the session key from user to user_id
    # because she was running into issues with the cookie being too large
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
