#session controller
get '/login' do
  erb :'/users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    # Right now the error messages is a string in an array
    @errors = 'Invalid username or password!'
    erb :'/users/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
