#user controller

get '/login' do
  erb :"/users/login"
end

post '/login' do
  @user = User.find_by(username: params[:username])
  redirect '/users'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users' do
  @users = User.all
end

get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
end
