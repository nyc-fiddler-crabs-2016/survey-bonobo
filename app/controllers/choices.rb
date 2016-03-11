post '/choices' do
  @choices = Choices.create(content: params[:content], question_id: session[:question_id])
  erb :'choices/_show', layout: false
end
