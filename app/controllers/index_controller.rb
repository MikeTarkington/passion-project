get '/' do
  @users = User.all
  erb :'lrstance'
end
