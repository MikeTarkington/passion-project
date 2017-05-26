get '/' do
  @users = User.all
  @congress_member = CongressMember.new
  @members = @congress_member.get_basic_member_details
  erb :'lrstance'
end
