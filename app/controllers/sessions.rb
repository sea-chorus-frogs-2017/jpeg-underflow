delete '/sessions' do
  # DELETE SESSION
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
    @error = "Invalid email"
    erb :'/index'
  end

  # create session[:user]
  # redirect to home
end
