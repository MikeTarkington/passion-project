post '/quiz_responses' do
  params[:response][:user_id] = current_user.id
  @resp = Response.new(params[:response])
  # @resp.stance_determinator
  # @resp.set_quiz_result
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
