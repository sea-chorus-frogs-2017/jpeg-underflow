delete '/sessions' do
  session.destroy
  redirect '/'
end

post '/sessions' do
  email = params[:user][:email]
  user = User.find_by(email: email)
  if user
    if user.authenticate(email, params[:user][:password])
      session[:user] = user
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
