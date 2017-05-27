post '/congress_members' do
  @member_to_show = CongressMember.new
  @member_full_deets = @member_to_show.get_member_full_info(params["full_name"], params["state"])
  erb :'/congress_members/show'
end
