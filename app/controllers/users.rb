#user controller

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
