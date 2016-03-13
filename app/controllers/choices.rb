# post '/choices' do
#   @choices = Choice.create(content: params[:content], question_id: session[:question_id])
#   # erb :'choices/_show', layout: false
# end

get '/surveys/:survey_id/questions/:question_id/choices/:id' do

  @survey = Survey.find_by(id: params[:survey_id])
  @choice = Choice.find_by(id: params[:id])
  @question = Question.find_by(id: params[:question_id])
  # binding.pry
  if @question.id <= @survey.questions.length
    erb :'/surveys/show'
  else
    redirect '/'
  end
end

put '/surveys/:survey_id/questions/:question_id/choices/:id' do
  @survey = Survey.find_by(id: params[:survey_id])
  @choice = Choice.find_by(id: params[:id])
  @choice.update(reader_id: session[:user_id], selected: params[:selected])
  @question = Question.find_by(id: params[:question_id])
  redirect "/surveys/#{@survey.id}/questions/#{(@question.id)}/choices/#{@choice.id}"
end







