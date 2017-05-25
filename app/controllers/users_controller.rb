get '/' do
  @users = User.all
  erb :'skeletor'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.email = params[:email]
  user.password = params[:password_string]
  if user.save
    login(user)
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end