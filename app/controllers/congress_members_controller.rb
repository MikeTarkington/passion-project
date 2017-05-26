post '/congress_members' do
  @member_to_show = CongressMember.new
  p '*' * 80
  p params
  p @member_to_show.get_member_basic_info(params["full_name"], params["state"])
end
