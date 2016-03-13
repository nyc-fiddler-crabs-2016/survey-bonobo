# post '/choices' do
#   @choices = Choice.create(content: params[:content], question_id: session[:question_id])
#   # erb :'choices/_show', layout: false
# end

get '/surveys/:survey_id/choices/:id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @choice = Choice.find_by(id: params[:id])
  binding.pry
  erb :'/surveys/show'
end

put '/surveys/:survey_id/choices/:id' do

  @choice = Choice.find_by(id: params[:id])
  @choice.update(reader_id: session[:user_id], selected: params[:selected])

  erb :'/surveys/_choices_update'
end


