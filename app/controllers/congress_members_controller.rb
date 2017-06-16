get '/congress_members' do
  @users = User.all
  @congress_member = CongressMember.new
  @members = @congress_member.get_basic_member_details
  erb :'congress_members/finder'
end


post '/congress_members' do
  @member_to_show = CongressMember.new
  @member_full_deets = @member_to_show.get_member_full_info(params["full_name"], params["state"])
  if request.xhr?
    erb :'congress_members/_member_search_result', {layout: false, locals: {full_deets: @member_full_deets } }
  else
    erb :'/congress_members/show'
  end
end

get '/congress_members/:id' do
  
end
