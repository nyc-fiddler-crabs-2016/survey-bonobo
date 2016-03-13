post '/choices' do
  question = Question.find(session[:question_id])
  @choices = question.choices
  params[:choices].each do |choice|
    Choice.create(question_id: session[:question_id], content: choice[1])
  end
  erb :'choices/_show', layout: false
end

get '/choices' do
  erb :'choices/_new', layout: false
end

post '/choices/additional' do
  question = Question.find(session[:question_id])
  @choices = question.choices
  @choice = Choice.create(content: params[:content], question_id: session[:question_id])
  erb :'choices/_show_additional', layout: false
end
