get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end


post '/surveys' do
  @survey = Survey.create(name: params[:name], description: params[:description], author_id: current_user.id)
  erb :'surveys/_show', layout: false
end


get '/surveys/:id' do
  @survey = Survey.find_by(id: params[:id])
  erb :'surveys/show'
end



