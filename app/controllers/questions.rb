get '/questions/new' do
  erb :'questions/_question_form', layout: false
end


post '/questions' do
  @question = Question.create(content: params[:content], survey_id: session[:survey_id])
  session[:question_id] = @question.id
  erb :'questions/_show', layout: false
end
