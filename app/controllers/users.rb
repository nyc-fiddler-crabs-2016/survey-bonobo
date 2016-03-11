#user controller

get '/login' do
  erb :"/users/login"
end

post '/login' do
  @user = User.find_by(username: params[:username])
  session[:user_id] = @user.id
  redirect '/users'
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users' do
  # this will eventually be removed, replaced with a redirect to homepage
  erb :'/users/index'
end

get '/users/new' do
  erb :"/users/new"
end

post '/users' do
  @user = User.new(username: params[:username], password: params[:password], email: params[:email])
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
    end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :'/users/edit'
end

put '/users/:id' do
  user = User.find_by(id: params[:id])
  user.update(username: params[:username],password: params[:password], email: params[:email])
  redirect "/users/#{user.id}"
end

delete '/users/:id' do
  user = User.find_by(id: params[:id])
  user.destroy
    redirect '/users'
end
