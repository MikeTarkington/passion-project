get '/quiz_responses/new' do
  @quiz = Quiz.first #will need to change if there are ever more quizes with diff questions
  erb :'/quiz_responses/new'
end

post '/quiz_responses' do
  params[:response][:user_id] = current_user.id
  @resp = Response.new(params[:response])
  if @resp.save
    redirect "/quiz_responses/#{@resp.id}"
  else
    @errors = @resp.errors.full_messages
    erb :'/quiz_responses/new'
  end
end

get '/quiz_responses/:id' do
  @resp = Response.find(params[:id])
  erb :'/quiz_responses/show'
end
