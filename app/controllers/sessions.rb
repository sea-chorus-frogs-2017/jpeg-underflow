
delete '/sessions' do
  session.destroy
  redirect '/'
end


post '/sessions' do
  email = params[:user][:email]
  user = User.find_by(email: email)
  if user
    if user.authenticate(email, params[:user][:password])
      # Hello, TEAM JPEG! I changed the session key from user to user_id
      # because I was running into issues with the cookie being too large
      # session[:user] = user
      session[:user_id] = user.id
      redirect '/'
    else
      @error = "Invalid password."
      erb :'/index'
    end
  else
    @error = "Invalid email."
    erb :'/index'
  end
end

#helper to allow us to see what is in session
get '/session-viewer' do
  session.inspect
end