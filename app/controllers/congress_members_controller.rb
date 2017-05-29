post '/congress_members' do
  @member_to_show = CongressMember.new
  @member_full_deets = @member_to_show.get_member_full_info(params["full_name"], params["state"])
  if request.xhr?
    erb :'congress_members/_member_search_result', {layout: false, locals: {full_deets: @member_full_deets } }
  else
    erb :'/congress_members/show'
  end
end
