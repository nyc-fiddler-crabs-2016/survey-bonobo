post '/questions' do
  @question = Question.create(content: params[:content], survey_id: session[:survey_id])
  session[:question_id] = @question.id
  erb :'questions/_show', layout: false
end
