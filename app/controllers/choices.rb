post '/choices' do
  @choice = Choice.create(content: params[:content], question_id: session[:question_id])
  erb :'choices/_show', layout: false
end

get '/choices' do
  erb :'choices/_new', layout: false
end
