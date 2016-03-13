post '/choices' do
  question = Question.find(session[:question_id])
  @choices = question.choices
  @choice = Choice.create(content: params[:content], question_id: session[:question_id])
  erb :'choices/_show', layout: false
end

get '/choices' do
  @counter = Choice.all.length
  erb :'choices/_new', layout: false
end
