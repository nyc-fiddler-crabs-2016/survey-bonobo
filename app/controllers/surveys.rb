get '/surveys' do
  @surveys = Survey.all
  erb :'surveys/index'
end

get '/surveys/new' do
  erb :'surveys/new'
end


post '/surveys' do
  @survey = Survey.create(name: params[:name], description: params[:description], author_id: current_user.id)
  session[:survey_id]  = @survey.id
  erb :'surveys/_show', layout: false, locals: {survey: @survey}
end


get '/surveys/:survey_id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = @survey.questions.first
  erb :'surveys/show'
end



